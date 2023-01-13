import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of `appcenter_analytics` must extend.
abstract class AppCenterAnalyticsPlatformInterface extends PlatformInterface {
  /// Create an instance.
  AppCenterAnalyticsPlatformInterface() : super(token: _token);

  static AppCenterAnalyticsPlatformInterface _instance =
      AppCenterAnalyticsMethodChannel();

  static final Object _token = Object();

  /// The current default [AppCenterAnalyticsPlatformInterface] instance.
  static AppCenterAnalyticsPlatformInterface get instance => _instance;

  static set instance(final AppCenterAnalyticsPlatformInterface instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Track a custom event with [name].
  ///
  /// The [name] cannot be null or empty.
  ///
  /// For App Center, the [name] cannot be longer than 256 and is truncated
  /// otherwise.
  Future<void> trackEvent({
    required final String name,
    required final Map<String, String>? properties,
    required final int? flags,
  }) async =>
      throw UnimplementedError('trackEvent has not been implemented.');

  /// Pauses log transmission.
  ///
  /// This API cannot be used if the service is disabled.
  Future<void> pause() async =>
      throw UnimplementedError('pause has not been implemented.');

  /// Resumes log transmission if paused.
  ///
  /// This API cannot be used if the service is disabled.
  Future<void> resume() async =>
      throw UnimplementedError('resume has not been implemented.');

  /// Enable Analytics service.
  Future<void> enable() async =>
      throw UnimplementedError('enable has not been implemented.');

  /// Disable Analytics service.
  Future<void> disable() async =>
      throw UnimplementedError('disable has not been implemented.');

  /// Check whether Analytics service is enabled or not.
  Future<bool> isEnabled() async =>
      throw UnimplementedError('analyticsIsEnabled has not been implemented.');

  /// Enable manual session tracker.
  Future<void> enableManualSessionTracker() async => throw UnimplementedError(
        'enableManualSessionTracker has not been implemented.',
      );

  /// Start a new session if manual session tracker is enabled,otherwise do
  /// nothing.
  Future<void> startSession() async =>
      throw UnimplementedError('startSession has not been implemented.');

  /// Set transmission interval.
  ///
  /// The transmission interval should be between 3 seconds and 86400 seconds
  /// (1 day).
  ///
  /// Should be called before the service is started
  Future<bool> setTransmissionInterval(final int seconds) async =>
      throw UnimplementedError(
        'setTransmissionInterval has not been implemented.',
      );
}
