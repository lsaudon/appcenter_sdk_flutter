import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  // Because
  // ignore: avoid-ignoring-return-values
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AppCenterCrashes',
    () {
      test('isEnabled', () async {
        final api = AppCenterCrashesApiMock();
        when(api.crashesIsEnabled).thenAnswer((final _) async => true);

        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final isEnabled = await AppCenterCrashes.isEnabled();

        expect(isEnabled, true);
        verify(api.crashesIsEnabled).called(1);
      });
    },
  );
}
