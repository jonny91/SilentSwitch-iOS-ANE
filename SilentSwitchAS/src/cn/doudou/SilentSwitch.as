package cn.doudou
{
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	/**
	 * 硬件静音开关
	 * @author 兜兜大侠
	 * @date 2015-10-12 上午11:19:53
	 * 
	 */
	public class SilentSwitch
	{
		private static var extContext:ExtensionContext;

		public function SilentSwitch()
		{
		}
		
		/**
		 *静音开关生效 
		 * 
		 */
		public static function apply():void
		{
			extContext = ExtensionContext.createExtensionContext("cn.doudou.ane.silentswitch",null);
			extContext.addEventListener(StatusEvent.STATUS,onLoghandler);
			extContext.call("apply");
		}
		
		protected static function onLoghandler(event:StatusEvent):void
		{
			trace("ANE::SilentSwitch =====>> "+event.level + " " + event.code);
		}
	}
}