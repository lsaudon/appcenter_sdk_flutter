import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_platform_interface.dart';
import 'package:meta/meta.dart';

/// [AppCenterAnalytics]
class AppCenterAnalytics {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterAnalyticsPlatformInterface instance) {
    AppCenterAnalyticsPlatformInterface.instance = instance;
  }

  /// Track a custom event with [name].
  ///
  /// The [name] cannot be null or empty.
  ///
  /// For App Center, the [name] cannot be longer than 256 and is truncated
  /// otherwise.
  static Future<void> trackEvent({
    required final String name,
    final Map<String, String>? properties,
    final int? flags,
  }) =>
      AppCenterAnalyticsPlatformInterface.instance
          .trackEvent(name: name, properties: properties, flags: flags);

  /// Pauses log transmission.
  ///
  /// This API cannot be used if the service is disabled.
  static Future<void> pause() =>
      AppCenterAnalyticsPlatformInterface.instance.pause();

  /// Resumes log transmission if paused.
  ///
  /// This API cannot be used if the service is disabled.
  static Future<void> resume() =>
      AppCenterAnalyticsPlatformInterface.instance.resume();

  /// Enable Analytics service.
  static Future<void> enable() =>
      AppCenterAnalyticsPlatformInterface.instance.enable();

  /// Disable Analytics service.
  static Future<void> disable() =>
      AppCenterAnalyticsPlatformInterface.instance.disable();

  /// Check whether Analytics service is enabled or not.
  static Future<bool> isEnabled() =>
      AppCenterAnalyticsPlatformInterface.instance.isEnabled();

  /// Enable manual session tracker.
  static Future<void> enableManualSessionTracker() =>
      AppCenterAnalyticsPlatformInterface.instance.enableManualSessionTracker();

  /// Start a new session if manual session tracker is enabled,otherwise do
  /// nothing.
  static Future<void> startSession() =>
      AppCenterAnalyticsPlatformInterface.instance.startSession();

  /// Set transmission interval.
  /// The transmission interval should be between 3 seconds and 86400 seconds.
  /// Should be called before the service is started.
  static Future<bool> setTransmissionInterval(final int seconds) =>
      AppCenterAnalyticsPlatformInterface.instance
          .setTransmissionInterval(seconds);
}
