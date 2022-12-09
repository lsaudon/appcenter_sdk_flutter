import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_platform_interface.dart';

class AppCenter {
  static Future<void> start({required final String secret}) async =>
      AppCenterPlatform.instance.start(secret: secret);

  static Future<void> enable() async => AppCenterPlatform.instance.enable();

  static Future<void> disable() async => AppCenterPlatform.instance.disable();

  static Future<bool> isEnabled() async =>
      AppCenterPlatform.instance.isEnabled();

  static Future<bool> isConfigured() async =>
      AppCenterPlatform.instance.isConfigured();

  static Future<String> getInstallId() async =>
      AppCenterPlatform.instance.getInstallId();

  static Future<bool> isRunningInAppCenterTestCloud() async =>
      AppCenterPlatform.instance.isRunningInAppCenterTestCloud();
}
