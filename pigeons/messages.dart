// ignore_for_file: avoid_positional_boolean_parameters

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    kotlinOut:
        'android/src/main/kotlin/fr/lsaudon/appcenter_sdk_flutter/Messages.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'fr.lsaudon.appcenter_sdk_flutter',
    ),
  ),
)
@HostApi()
abstract class AppCenterSdkApi {
  void start(final String secret);
  void trackException(
    final String message,
    final String? type,
    final String? stackTrace,
    final Map<String, String>? properties,
  );
}
