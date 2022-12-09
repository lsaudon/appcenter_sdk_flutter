import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  // Because
  // ignore: avoid-ignoring-return-values
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AppCenterAnalytics',
    () {
      test('isEnabled', () async {
        final api = AppCenterAnalyticsApiMock();
        when(api.analyticsIsEnabled).thenAnswer((final _) async => true);

        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        final isEnabled = await AppCenterAnalytics.isEnabled();

        expect(isEnabled, true);
        verify(api.analyticsIsEnabled).called(1);
      });
    },
  );
}
