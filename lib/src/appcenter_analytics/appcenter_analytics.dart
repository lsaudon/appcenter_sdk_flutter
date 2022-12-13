import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_platform_interface.dart';
import 'package:meta/meta.dart';

class AppCenterAnalytics {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterAnalyticsPlatformInterface instance) {
    AppCenterAnalyticsPlatformInterface.instance = instance;
  }

  static Future<void> trackEvent({
    required final String name,
    final Map<String, String>? properties,
    final int? flags,
  }) =>
      AppCenterAnalyticsPlatformInterface.instance
          .trackEvent(name: name, properties: properties, flags: flags);

  static Future<void> pause() =>
      AppCenterAnalyticsPlatformInterface.instance.pause();

  static Future<void> resume() =>
      AppCenterAnalyticsPlatformInterface.instance.resume();

  static Future<void> enable() =>
      AppCenterAnalyticsPlatformInterface.instance.enable();

  static Future<void> disable() =>
      AppCenterAnalyticsPlatformInterface.instance.disable();

  static Future<bool> isEnabled() =>
      AppCenterAnalyticsPlatformInterface.instance.isEnabled();

  static Future<void> enableManualSessionTracker() =>
      AppCenterAnalyticsPlatformInterface.instance.enableManualSessionTracker();

  static Future<void> startSession() =>
      AppCenterAnalyticsPlatformInterface.instance.startSession();

  /// Set transmission interval.
  /// The transmission interval should be between 3 seconds and 86400 seconds.
  /// Should be called before the service is started.
  static Future<bool> setTransmissionInterval(final int seconds) =>
      AppCenterAnalyticsPlatformInterface.instance
          .setTransmissionInterval(seconds);
}
