#import "AppCenterSdkFlutterPlugin.h"
#if __has_include(<appcenter_sdk_flutter/appcenter_sdk_flutter-Swift.h>)
#import <appcenter_sdk_flutter/appcenter_sdk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "appcenter_sdk_flutter-Swift.h"
#endif

@implementation AppCenterSdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppCenterSdkFlutterPlugin registerWithRegistrar:registrar];
}
@end
