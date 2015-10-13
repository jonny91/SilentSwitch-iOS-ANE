//
//  SilentSwitch.m
//  SilentSwitchOC
//
//  Created by 洪金敏 on 15/10/10.
//  Copyright © 2015年 兜兜大侠. All rights reserved.
//

#import "SilentSwitch.h"

@implementation SilentSwitch

/**
 *  初始化 设置对外公开的方法
 *
 *  @param extData           <#extData description#>
 *  @param ctxType           <#ctxType description#>
 *  @param ctx               <#ctx description#>
 *  @param numFunctionsToSet <#numFunctionsToSet description#>
 *  @param functionsToSet    <#functionsToSet description#>
 */
void ContextInitializer(
                        void*                    extData          ,
                        const uint8_t*           ctxType          ,
                        FREContext               ctx              ,
                        uint32_t*                numFunctionsToSet,
                        const FRENamedFunction** functionsToSet
                        )
{
    //log
    FREDispatchStatusEventAsync(ctx, (uint8_t*)"log", (uint8_t*)"ContextInitializer");
    
    *numFunctionsToSet = 1;
    
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * *numFunctionsToSet);
    
    func[0].name = (const uint8_t *)"apply";
    func[0].functionData = NULL;
    func[0].function = &apply;
    
    *functionsToSet = func;
}

void ExtensionInitializer(
                          void**                 extDataToSet       ,
                          FREContextInitializer* ctxInitializerToSet,
                          FREContextFinalizer*   ctxFinalizerToSet
                          )
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
}

/**
 *  切换静音的时候 对外抛出事件
 *
 *  @param ctx          <#ctx description#>
 *  @param functionData <#functionData description#>
 *  @param argc         <#argc description#>
 *  @param argv         <#argv description#>
 *
 *  @return <#return value description#>
 */
FREObject apply(FREContext ctx,
                void*      functionData,
                uint32_t   argc,
                FREObject  argv[]
                )
{
    AVAudioSession * audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    
    FREDispatchStatusEventAsync(ctx, (uint8_t*)"log", (uint8_t*)"complete set");
    return NULL;
}

@end
