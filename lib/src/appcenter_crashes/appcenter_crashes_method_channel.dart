import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_platform_interface.dart';
import 'package:appcenter_sdk_flutter/src/messages.g.dart';
import 'package:meta/meta.dart';

/// The method channel implementation of [AppCenterCrashesPlatformInterface].
class AppCenterCrashesMethodChannel extends AppCenterCrashesPlatformInterface {
  /// Creates a new [AppCenterCrashesMethodChannel] instance.
  factory AppCenterCrashesMethodChannel() =>
      AppCenterCrashesMethodChannel.internal(api: AppCenterCrashesApi());

  /// Creates a new [AppCenterCrashesMethodChannel] instance for unit tests.
  @visibleForTesting
  AppCenterCrashesMethodChannel.internal({
    required final AppCenterCrashesApi api,
  }) : _api = api;

  final AppCenterCrashesApi _api;

  @override
  Future<void> generateTestCrash() async => _api.generateTestCrash();

  @override
  Future<bool> hasReceivedMemoryWarningInLastSession() async =>
      _api.hasReceivedMemoryWarningInLastSession();

  @override
  Future<bool> hasCrashedInLastSession() async =>
      _api.hasCrashedInLastSession();

  @override
  Future<void> enable() async => _api.crashesSetEnabled(true);

  @override
  Future<void> disable() async => _api.crashesSetEnabled(false);

  @override
  Future<bool> isEnabled() async => _api.crashesIsEnabled();

  @override
  Future<void> trackException({
    required final String message,
    required final Type? type,
    required final StackTrace? stackTrace,
    required final Map<String, String>? properties,
  }) async =>
      _api.trackException(
        message,
        type.toString(),
        stackTrace.toString(),
        properties,
      );
}
