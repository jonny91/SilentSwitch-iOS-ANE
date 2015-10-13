package
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import cn.doudou.SilentSwitch;
	
	
	/**
	 *  
	 * @author 兜兜大侠
	 * @date 2015-10-12 下午2:18:00
	 * 
	 */
	public class SlientSwitchTest extends Sprite
	{
		public function SlientSwitchTest()
		{
			super();
			
			var urlRequest:URLRequest = new URLRequest("1.mp3");
			var sound:Sound = new Sound(urlRequest);
			sound.play();
			
			SilentSwitch.apply();
		}
	}
}