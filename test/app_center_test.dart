import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

void main() {
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

      test('enable', () async {
        final api = AppCenterApiMock();
        when(() => api.setEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        await AppCenter.enable();

        verify(() => api.setEnabled(true)).called(1);
      });

      test('disable', () async {
        final api = AppCenterApiMock();
        when(() => api.setEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        await AppCenter.disable();

        verify(() => api.setEnabled(false)).called(1);
      });

      test('isEnabled return true', () async {
        final api = AppCenterApiMock();
        const expected = true;
        when(api.isEnabled).thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isEnabled();

        expect(value, expected);
        verify(api.isEnabled).called(1);
      });

      test('isEnabled return false', () async {
        final api = AppCenterApiMock();
        const expected = false;
        when(api.isEnabled).thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isEnabled();

        expect(value, expected);
        verify(api.isEnabled).called(1);
      });

      test('isConfigured return true', () async {
        final api = AppCenterApiMock();
        const expected = true;
        when(api.isConfigured).thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isConfigured();

        expect(value, expected);
        verify(api.isConfigured).called(1);
      });

      test('isConfigured return false', () async {
        final api = AppCenterApiMock();
        const expected = true;
        when(api.isConfigured).thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isConfigured();

        expect(value, expected);
        verify(api.isConfigured).called(1);
      });

      test('getInstallId', () async {
        final api = AppCenterApiMock();
        const expected = 'InstallId';
        when(api.getInstallId).thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.getInstallId();

        expect(value, expected);
        verify(api.getInstallId).called(1);
      });

      test('isRunningInAppCenterTestCloud return true', () async {
        final api = AppCenterApiMock();
        const expected = true;
        when(api.isRunningInAppCenterTestCloud)
            .thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isRunningInAppCenterTestCloud();

        expect(value, expected);
        verify(api.isRunningInAppCenterTestCloud).called(1);
      });

      test('isRunningInAppCenterTestCloud return false', () async {
        final api = AppCenterApiMock();
        const expected = false;
        when(api.isRunningInAppCenterTestCloud)
            .thenAnswer((final _) async => expected);
        AppCenter.instance = AppCenterMethodChannel.internal(api: api);

        final value = await AppCenter.isRunningInAppCenterTestCloud();

        expect(value, expected);
        verify(api.isRunningInAppCenterTestCloud).called(1);
      });
    },
  );
}
