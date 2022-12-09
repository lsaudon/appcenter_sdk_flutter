import 'package:appcenter_sdk_flutter/src/messages.g.dart';

import 'appcenter_sdk_flutter_platform_interface.dart';

class MethodChannelAppCenterSdkFlutter extends AppCenterSdkFlutterPlatform {
  final AppCenterSdkApi _api = AppCenterSdkApi();

  @override
  Future<void> start({required String secret}) async {
    await _api.start(secret);
  }

  @override
  Future<void> trackException({
    required String message,
    required Type? type,
    required StackTrace? stackTrace,
    required Map<String?, String?>? properties,
  }) async {
    await _api.trackException(
        message, type.toString(), stackTrace.toString(), properties);
  }
}
