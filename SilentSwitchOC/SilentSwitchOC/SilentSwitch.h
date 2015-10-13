//
//  SilentSwitch.h
//  SilentSwitch
//
//  Created by 洪金敏 on 15/10/8.
//  Copyright © 2015年 兜兜大侠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "FlashRuntimeExtensions.h"

@import AVFoundation;

/**
 *  开启静音开关
 */
uint8_t * const ON = (uint8_t *)"SILENT_ON";
/**
 *  关闭静音开关
 */
uint8_t * const OFF = (uint8_t *)"SILENT_OFF";

/**
 *  静音事件
 */
uint8_t * const SILENT = (uint8_t *)"SILENT";

@interface SilentSwitch : NSObject


@end
