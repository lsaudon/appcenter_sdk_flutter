import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AppCenterAnalyticsPlatformInterface extends PlatformInterface {
  AppCenterAnalyticsPlatformInterface() : super(token: _token);

  static AppCenterAnalyticsPlatformInterface _instance =
      AppCenterAnalyticsMethodChannel();

  static final Object _token = Object();

  static AppCenterAnalyticsPlatformInterface get instance => _instance;

  static set instance(final AppCenterAnalyticsPlatformInterface instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> trackEvent({
    required final String name,
    required final Map<String, String>? properties,
    required final int? flags,
  }) async =>
      throw UnimplementedError('trackEvent has not been implemented.');

  Future<void> pause() async =>
      throw UnimplementedError('pause has not been implemented.');

  Future<void> resume() async =>
      throw UnimplementedError('resume has not been implemented.');

  Future<void> enable() async =>
      throw UnimplementedError('enable has not been implemented.');

  Future<void> disable() async =>
      throw UnimplementedError('disable has not been implemented.');

  Future<bool> isEnabled() async =>
      throw UnimplementedError('analyticsIsEnabled has not been implemented.');

  Future<void> enableManualSessionTracker() async => throw UnimplementedError(
        'enableManualSessionTracker has not been implemented.',
      );

  Future<void> startSession() async =>
      throw UnimplementedError('startSession has not been implemented.');

  Future<bool> setTransmissionInterval(final int seconds) async =>
      throw UnimplementedError(
        'setTransmissionInterval has not been implemented.',
      );
}
