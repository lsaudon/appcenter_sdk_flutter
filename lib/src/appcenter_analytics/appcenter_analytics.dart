import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_platform_interface.dart';

class AppCenterAnalytics {
  static Future<void> trackEvent({
    required final String name,
    final Map<String, String>? properties,
    final int? flags,
  }) async =>
      AppCenterAnalyticsPlatform.instance.trackEvent(name, properties, flags);

  static Future<void> pause() async =>
      AppCenterAnalyticsPlatform.instance.pause();

  static Future<void> resume() async =>
      AppCenterAnalyticsPlatform.instance.resume();

  static Future<void> enable() async =>
      AppCenterAnalyticsPlatform.instance.enable();

  static Future<void> disable() async =>
      AppCenterAnalyticsPlatform.instance.disable();

  static Future<bool> isEnabled() async =>
      AppCenterAnalyticsPlatform.instance.isEnabled();

  static Future<void> enableManualSessionTracker() async =>
      AppCenterAnalyticsPlatform.instance.enableManualSessionTracker();

  static Future<void> startSession() async =>
      AppCenterAnalyticsPlatform.instance.startSession();

  static Future<bool> setTransmissionInterval(final int seconds) async =>
      AppCenterAnalyticsPlatform.instance.setTransmissionInterval(seconds);
}
