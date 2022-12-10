import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:appcenter_sdk_flutter/src/appcenter_crashes/appcenter_crashes_method_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'AppCenterCrashes',
    () {
      test('generateTestCrash', () async {
        final api = AppCenterCrashesApiMock();
        when(api.generateTestCrash).thenAnswer((final _) async => Future<void>);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        await AppCenterCrashes.generateTestCrash();

        verify(api.generateTestCrash).called(1);
      });

      test('hasReceivedMemoryWarningInLastSession return true', () async {
        final api = AppCenterCrashesApiMock();
        const expected = true;
        when(api.hasReceivedMemoryWarningInLastSession)
            .thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value =
            await AppCenterCrashes.hasReceivedMemoryWarningInLastSession();

        expect(value, expected);
        verify(api.hasReceivedMemoryWarningInLastSession).called(1);
      });

      test('hasReceivedMemoryWarningInLastSession return false', () async {
        final api = AppCenterCrashesApiMock();
        const expected = false;
        when(api.hasReceivedMemoryWarningInLastSession)
            .thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value =
            await AppCenterCrashes.hasReceivedMemoryWarningInLastSession();

        expect(value, expected);
        verify(api.hasReceivedMemoryWarningInLastSession).called(1);
      });

      test('hasCrashedInLastSession return true', () async {
        final api = AppCenterCrashesApiMock();
        const expected = true;
        when(api.hasCrashedInLastSession)
            .thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value = await AppCenterCrashes.hasCrashedInLastSession();

        expect(value, expected);
        verify(api.hasCrashedInLastSession).called(1);
      });

      test('hasCrashedInLastSession return false', () async {
        final api = AppCenterCrashesApiMock();
        const expected = false;
        when(api.hasCrashedInLastSession)
            .thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value = await AppCenterCrashes.hasCrashedInLastSession();

        expect(value, expected);
        verify(api.hasCrashedInLastSession).called(1);
      });

      test('enable', () async {
        final api = AppCenterCrashesApiMock();
        when(() => api.crashesSetEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        await AppCenterCrashes.enable();

        verify(() => api.crashesSetEnabled(true)).called(1);
      });

      test('disable', () async {
        final api = AppCenterCrashesApiMock();
        when(() => api.crashesSetEnabled(any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        await AppCenterCrashes.disable();

        verify(() => api.crashesSetEnabled(false)).called(1);
      });

      test('isEnabled return true', () async {
        final api = AppCenterCrashesApiMock();
        const expected = true;
        when(api.crashesIsEnabled).thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value = await AppCenterCrashes.isEnabled();

        expect(value, expected);
        verify(api.crashesIsEnabled).called(1);
      });

      test('isEnabled return false', () async {
        final api = AppCenterCrashesApiMock();
        const expected = false;
        when(api.crashesIsEnabled).thenAnswer((final _) async => expected);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final value = await AppCenterCrashes.isEnabled();

        expect(value, expected);
        verify(api.crashesIsEnabled).called(1);
      });

      test('trackException', () async {
        final api = AppCenterCrashesApiMock();
        when(() => api.trackException(any(), any(), any(), any()))
            .thenAnswer((final _) async => Future<void>);
        AppCenterCrashes.instance =
            AppCenterCrashesMethodChannel.internal(api: api);

        final exception = Exception('Message');
        const stackTraceString = 'I am a stack trace.';
        await AppCenterCrashes.trackException(
          message: exception.toString(),
          type: exception.runtimeType,
          stackTrace: StackTrace.fromString(stackTraceString),
          properties: {'Property': 'Value'},
        );

        verify(
          () => api.trackException(
            exception.toString(),
            exception.runtimeType.toString(),
            stackTraceString,
            {'Property': 'Value'},
          ),
        ).called(1);
      });
    },
  );
}
