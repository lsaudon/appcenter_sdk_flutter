import 'appcenter_sdk_flutter_platform_interface.dart';

class AppCenterSdkFlutter {
  static Future<void> start({required String secret}) async =>
      await AppCenterSdkFlutterPlatform.instance.start(secret: secret);

  static Future<void> trackException({
    required String message,
    Type? type,
    StackTrace? stackTrace,
    Map<String?, String?>? properties,
  }) async =>
      await AppCenterSdkFlutterPlatform.instance.trackException(
        message: message,
        type: type,
        stackTrace: stackTrace,
        properties: properties,
      );
}
