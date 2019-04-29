//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <BatteryPlugin.h>
#import <FlutterBoostPlugin.h>
#import <FlutterPluginCrashsdkPlugin.h>
#import <PackageInfoPlugin.h>
#import <UrlLauncherPlugin.h>
#import <XserviceKitPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTBatteryPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTBatteryPlugin"]];
  [FlutterBoostPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBoostPlugin"]];
  [FlutterPluginCrashsdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterPluginCrashsdkPlugin"]];
  [FLTPackageInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
  [XserviceKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"XserviceKitPlugin"]];
}

@end
