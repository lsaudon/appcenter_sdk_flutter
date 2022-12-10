import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter_analytics/appcenter_analytics_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AppCenterAnalytics',
    () {
      test('trackEvent', () async {
        final api = AppCenterAnalyticsApiMock();
        when(() => api.trackEvent(any(), any(), any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.trackEvent(
          name: 'Name',
          properties: {'Property': 'Value'},
          flags: 1,
        );

        verify(() => api.trackEvent('Name', {'Property': 'Value'}, 1))
            .called(1);
      });

      test('pause', () async {
        final api = AppCenterAnalyticsApiMock();
        when(api.pause).thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.pause();

        verify(api.pause).called(1);
      });

      test('resume', () async {
        final api = AppCenterAnalyticsApiMock();
        when(api.resume).thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.resume();

        verify(api.resume).called(1);
      });

      test('enable', () async {
        final api = AppCenterAnalyticsApiMock();
        when(() => api.analyticsSetEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.enable();

        verify(() => api.analyticsSetEnabled(true)).called(1);
      });

      test('disable', () async {
        final api = AppCenterAnalyticsApiMock();
        when(() => api.analyticsSetEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.disable();

        verify(() => api.analyticsSetEnabled(false)).called(1);
      });

      test('isEnabled return true', () async {
        final api = AppCenterAnalyticsApiMock();
        const expected = true;
        when(api.analyticsIsEnabled).thenAnswer((final _) async => expected);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        final value = await AppCenterAnalytics.isEnabled();

        expect(value, expected);
        verify(api.analyticsIsEnabled).called(1);
      });

      test('isEnabled return false', () async {
        final api = AppCenterAnalyticsApiMock();
        const expected = false;
        when(api.analyticsIsEnabled).thenAnswer((final _) async => expected);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        final value = await AppCenterAnalytics.isEnabled();

        expect(value, expected);
        verify(api.analyticsIsEnabled).called(1);
      });

      test('enableManualSessionTracker', () async {
        final api = AppCenterAnalyticsApiMock();
        when(api.enableManualSessionTracker)
            .thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.enableManualSessionTracker();

        verify(api.enableManualSessionTracker).called(1);
      });

      test('startSession', () async {
        final api = AppCenterAnalyticsApiMock();
        when(api.startSession).thenAnswer((final _) async => Future<void>);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        await AppCenterAnalytics.startSession();

        verify(api.startSession).called(1);
      });

      test('setTransmissionInterval', () async {
        final api = AppCenterAnalyticsApiMock();
        const expected = true;
        when(() => api.setTransmissionInterval(any()))
            .thenAnswer((final _) async => expected);
        AppCenterAnalytics.instance =
            AppCenterAnalyticsMethodChannel.internal(api: api);

        const seconds = 3;
        final value = await AppCenterAnalytics.setTransmissionInterval(seconds);

        expect(value, expected);
        verify(() => api.setTransmissionInterval(seconds)).called(1);
      });
    },
  );
}
