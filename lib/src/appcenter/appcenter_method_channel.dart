import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_platform_interface.dart';
import 'package:appcenter_sdk_flutter/src/messages.g.dart';

class MethodChannelAppCenter extends AppCenterPlatform {
  final AppCenterApi _api = AppCenterApi();

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
