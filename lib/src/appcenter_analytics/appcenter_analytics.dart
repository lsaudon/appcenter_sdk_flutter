import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_platform_interface.dart';

class AppCenterAnalytics {
  static Future<void> trackEvent({
    required final String name,
    final Map<String, String>? properties,
    final int? flags,
  }) =>
      AppCenterAnalyticsPlatformInterface.instance
          .trackEvent(name, properties, flags);

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

  static Future<bool> setTransmissionInterval(final int seconds) =>
      AppCenterAnalyticsPlatformInterface.instance
          .setTransmissionInterval(seconds);
}
