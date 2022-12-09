import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_platform_interface.dart';
import 'package:meta/meta.dart';

class AppCenterCrashes {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterCrashesPlatformInterface instance) {
    AppCenterCrashesPlatformInterface.instance = instance;
  }

  static Future<void> generateTestCrash() =>
      AppCenterCrashesPlatformInterface.instance.generateTestCrash();

  static Future<bool> hasReceivedMemoryWarningInLastSession() =>
      AppCenterCrashesPlatformInterface.instance
          .hasReceivedMemoryWarningInLastSession();

  static Future<bool> hasCrashedInLastSession() =>
      AppCenterCrashesPlatformInterface.instance.hasCrashedInLastSession();

  static Future<void> enable() =>
      AppCenterCrashesPlatformInterface.instance.enable();

  static Future<void> disable() =>
      AppCenterCrashesPlatformInterface.instance.disable();

  static Future<bool> isEnabled() =>
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
