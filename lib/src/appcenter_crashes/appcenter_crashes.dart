import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_platform_interface.dart';

class AppCenterCrashes {
  Future<void> generateTestCrash() async =>
      AppCenterCrashesPlatform.instance.generateTestCrash();

  Future<bool> hasReceivedMemoryWarningInLastSession() async =>
      AppCenterCrashesPlatform.instance.hasReceivedMemoryWarningInLastSession();

  Future<bool> hasCrashedInLastSession() async =>
      AppCenterCrashesPlatform.instance.hasCrashedInLastSession();

  Future<void> enable() async => AppCenterCrashesPlatform.instance.enable();

  Future<void> disable() async => AppCenterCrashesPlatform.instance.disable();

  Future<bool> isEnabled() async =>
      AppCenterCrashesPlatform.instance.isEnabled();

  static Future<void> trackException({
    required final String message,
    final Type? type,
    final StackTrace? stackTrace,
    final Map<String?, String?>? properties,
  }) async =>
      AppCenterCrashesPlatform.instance.trackException(
        message: message,
        type: type,
        stackTrace: stackTrace,
        properties: properties,
      );
}
