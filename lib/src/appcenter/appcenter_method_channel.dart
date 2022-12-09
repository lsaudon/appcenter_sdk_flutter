import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_platform_interface.dart';
import 'package:appcenter_sdk_flutter/src/messages.g.dart';
import 'package:meta/meta.dart';

class AppCenterMethodChannel extends AppCenterPlatformInterface {
  factory AppCenterMethodChannel() =>
      AppCenterMethodChannel.internal(api: AppCenterApi());

  @visibleForTesting
  AppCenterMethodChannel.internal({required final AppCenterApi api})
      : _api = api;

  final AppCenterApi _api;

  @override
  Future<void> start({required final String secret}) async =>
      _api.start(secret);

  @override
  Future<void> enable() async => _api.setEnabled(true);

  @override
  Future<void> disable() async => _api.setEnabled(false);

  @override
  Future<bool> isEnabled() async => _api.isEnabled();

  @override
  Future<bool> isConfigured() async => _api.isConfigured();

  @override
  Future<String> getInstallId() async => _api.getInstallId();

  @override
  Future<bool> isRunningInAppCenterTestCloud() async =>
      _api.isRunningInAppCenterTestCloud();
}
