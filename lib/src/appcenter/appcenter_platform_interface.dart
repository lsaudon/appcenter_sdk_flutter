import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AppCenterPlatformInterface extends PlatformInterface {
  AppCenterPlatformInterface() : super(token: _token);

  static AppCenterPlatformInterface _instance = AppCenterMethodChannel();

  static final Object _token = Object();

  static AppCenterPlatformInterface get instance => _instance;

  static set instance(final AppCenterPlatformInterface instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> start({required final String secret}) async =>
      throw UnimplementedError('start has not been implemented.');

  Future<void> enable() async =>
      throw UnimplementedError('enable has not been implemented.');

  Future<void> disable() async =>
      throw UnimplementedError('disable has not been implemented.');

  Future<bool> isEnabled() async =>
      throw UnimplementedError('isEnabled has not been implemented.');

  Future<bool> isConfigured() async =>
      throw UnimplementedError('isConfigured has not been implemented.');

  Future<String> getInstallId() async =>
      throw UnimplementedError('getInstallId has not been implemented.');

  Future<bool> isRunningInAppCenterTestCloud() async =>
      throw UnimplementedError(
        'isRunningInAppCenterTestCloud has not been implemented.',
      );
}
