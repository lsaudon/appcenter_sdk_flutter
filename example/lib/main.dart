import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCenter.start(secret: '<APP-SECRET>');
  FlutterError.onError = (final details) async {
    await AppCenterCrashes.trackException(
      message: details.exception.toString(),
      type: details.exception.runtimeType,
      stackTrace: details.stack,
    );
  };
  runApp(const MyApp());
}

/// MyApp widget.
class MyApp extends StatefulWidget {
  /// Initializes [key].
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(final BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('App Center Sdk'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                int.parse('not a number');
              },
              child: const Text('TrackException'),
            ),
          ),
        ),
      );
}
