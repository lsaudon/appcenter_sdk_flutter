import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of `appcenter_crashes` must extend.
abstract class AppCenterCrashesPlatformInterface extends PlatformInterface {
  /// Create an instance.
  AppCenterCrashesPlatformInterface() : super(token: _token);

  static AppCenterCrashesPlatformInterface _instance =
      AppCenterCrashesMethodChannel();

  static final Object _token = Object();

  /// The current default [AppCenterCrashesPlatformInterface] instance.
  static AppCenterCrashesPlatformInterface get instance => _instance;

  static set instance(final AppCenterCrashesPlatformInterface instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Generates crash for test purpose.
  Future<void> generateTestCrash() async =>
      throw UnimplementedError('generateTestCrash has not been implemented.');

  /// Check whether there was a memory warning in the last session.
  Future<bool> hasReceivedMemoryWarningInLastSession() async =>
      throw UnimplementedError(
        'hasReceivedMemoryWarningInLastSession has not been implemented.',
      );

  /// Check whether the app crashed in its last session.
  Future<bool> hasCrashedInLastSession() async => throw UnimplementedError(
        'hasCrashedInLastSession has not been implemented.',
      );

  /// Enable Crashes service.
  Future<void> enable() async =>
      throw UnimplementedError('enable has not been implemented.');

  /// Disable Crashes service.
  Future<void> disable() async =>
      throw UnimplementedError('disable has not been implemented.');

  /// Check whether Crashes service is enabled or not.
  Future<bool> isEnabled() async =>
      throw UnimplementedError('isEnabled has not been implemented.');

  /// Send an handled exception.
  Future<void> trackException({
    required final String message,
    required final Type? type,
    required final StackTrace? stackTrace,
    required final Map<String, String>? properties,
  }) async =>
      throw UnimplementedError(
        '''Future<void> trackException({required String message, Type? type, StackTrace? stackTrace, Map<String?, String?>? properties}) has not been implemented.''',
      );
}
