#import "FlutterPluginCrashsdkPlugin.h"
#import <crashreportsdk/crashreport.h>
 

@implementation FlutterPluginCrashsdkPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar
{
    FlutterMethodChannel* channel =
    [FlutterMethodChannel methodChannelWithName:@"flutter_plugin_crashsdk"
                                binaryMessenger:[registrar messenger]];
    FlutterPluginCrashsdkPlugin* instance = [[FlutterPluginCrashsdkPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString * crash_stack = [call.arguments objectForKey:@"crash_stack"];
    
    if ([call.method isEqualToString:@"api_report_crash"] && crash_stack) {
        
      [[CrashReport sharedObject] reportAbnormalMsg:crash_stack forType:AbnormalTypeFlutter];
        
        result(@"succ");
    }else
    {
        result(@"fail");
    }
}

@end
