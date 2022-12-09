import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_platform_interface.dart';

class AppCenterCrashes {
  Future<void> generateTestCrash() =>
      AppCenterCrashesPlatformInterface.instance.generateTestCrash();

  Future<bool> hasReceivedMemoryWarningInLastSession() =>
      AppCenterCrashesPlatformInterface.instance
          .hasReceivedMemoryWarningInLastSession();

  Future<bool> hasCrashedInLastSession() =>
      AppCenterCrashesPlatformInterface.instance.hasCrashedInLastSession();

  Future<void> enable() => AppCenterCrashesPlatformInterface.instance.enable();

  Future<void> disable() =>
      AppCenterCrashesPlatformInterface.instance.disable();

  Future<bool> isEnabled() =>
      AppCenterCrashesPlatformInterface.instance.isEnabled();

  static Future<void> trackException({
    required final String message,
    final Type? type,
    final StackTrace? stackTrace,
    final Map<String?, String?>? properties,
  }) =>
      AppCenterCrashesPlatformInterface.instance.trackException(
        message: message,
        type: type,
        stackTrace: stackTrace,
        properties: properties,
      );
}
