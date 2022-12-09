import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'appcenter_sdk_flutter_method_channel.dart';

abstract class AppCenterSdkFlutterPlatform extends PlatformInterface {
  /// Constructs a AppcenterSdkFlutterPlatform.
  AppCenterSdkFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppCenterSdkFlutterPlatform _instance =
      MethodChannelAppCenterSdkFlutter();
  static AppCenterSdkFlutterPlatform get instance => _instance;
  static set instance(AppCenterSdkFlutterPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<void> start({required String secret}) {
    throw UnimplementedError(
        'start({required String secret}) has not been implemented.');
  }

  Future<void> trackException({
    required String message,
    required Type? type,
    required StackTrace? stackTrace,
    required Map<String?, String?>? properties,
  }) {
    throw UnimplementedError(
        'Future<void> trackException({required String message, Type? type, StackTrace? stackTrace, Map<String?, String?>? properties}) has not been implemented.');
  }
}
