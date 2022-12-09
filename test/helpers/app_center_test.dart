import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  // Because
  // ignore: avoid-ignoring-return-values
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AppCenter',
    () {
      test('start', () async {
        final appCenterApi = AppCenterApiMock();
        when(() => appCenterApi.start(any()))
            .thenAnswer((final _) async => Future<void>);

        AppCenter.instance = AppCenterMethodChannel.internal(api: appCenterApi);

        await AppCenter.start(secret: 'APP-SECRET');

        verify(() => appCenterApi.start(any())).called(1);
      });
    },
  );
}
