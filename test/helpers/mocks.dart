// ignore_for_file: avoid-top-level-members-in-tests, prefer-match-file-name
import 'package:appcenter_sdk_flutter/src/messages.g.dart';
import 'package:mocktail/mocktail.dart';

class AppCenterApiMock extends Mock implements AppCenterApi {}

class AppCenterAnalyticsApiMock extends Mock implements AppCenterAnalyticsApi {}

class AppCenterCrashesApiMock extends Mock implements AppCenterCrashesApi {}
