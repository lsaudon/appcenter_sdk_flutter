import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_platform_interface.dart';
import 'package:meta/meta.dart';

class AppCenter {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterPlatformInterface instance) {
    AppCenterPlatformInterface.instance = instance;
  }

  static Future<void> start({required final String secret}) =>
      AppCenterPlatformInterface.instance.start(secret: secret);

  static Future<void> enable() => AppCenterPlatformInterface.instance.enable();

  static Future<void> disable() =>
      AppCenterPlatformInterface.instance.disable();

  static Future<bool> isEnabled() =>
      AppCenterPlatformInterface.instance.isEnabled();

  static Future<bool> isConfigured() =>
      AppCenterPlatformInterface.instance.isConfigured();

  static Future<String> getInstallId() =>
      AppCenterPlatformInterface.instance.getInstallId();

  static Future<bool> isRunningInAppCenterTestCloud() =>
      AppCenterPlatformInterface.instance.isRunningInAppCenterTestCloud();
}
