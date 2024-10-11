import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_platform_interface.dart';
import 'package:meta/meta.dart';

/// [AppCenterCrashes]
class AppCenterCrashes {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterCrashesPlatformInterface instance) {
    AppCenterCrashesPlatformInterface.instance = instance;
  }

  /// Generates crash for test purpose.
  static Future<void> generateTestCrash() =>
      AppCenterCrashesPlatformInterface.instance.generateTestCrash();

  /// Check whether there was a memory warning in the last session.
  static Future<bool> hasReceivedMemoryWarningInLastSession() =>
      AppCenterCrashesPlatformInterface.instance
          .hasReceivedMemoryWarningInLastSession();

  /// Check whether the app crashed in its last session.
  static Future<bool> hasCrashedInLastSession() =>
      AppCenterCrashesPlatformInterface.instance.hasCrashedInLastSession();

  /// Enable Crashes service.
  static Future<void> enable() =>
      AppCenterCrashesPlatformInterface.instance.enable();

  /// Disable Crashes service.
  static Future<void> disable() =>
      AppCenterCrashesPlatformInterface.instance.disable();

  /// Check whether Crashes service is enabled or not.
  static Future<bool> isEnabled() =>
      AppCenterCrashesPlatformInterface.instance.isEnabled();

  /// Send an handled exception.
  static Future<void> trackException({
    required final String message,
    final Type? type,
    final StackTrace? stackTrace,
    final Map<String, String>? properties,
  }) =>
      AppCenterCrashesPlatformInterface.instance.trackException(
        message: message,
        type: type,
        stackTrace: stackTrace,
        properties: properties,
      );
}
