import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCenterSdkFlutter.start(
      secret: '0a779203-0cea-4158-9e75-19c8e431d620');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Center Sdk'),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            try {
              int.parse('not a number');
            } catch (e, s) {
              AppCenterSdkFlutter.trackException(
                message: e.toString(),
                type: e.runtimeType,
                stackTrace: s,
              );
            }
          },
          child: const Text('TrackException'),
        )),
      ),
    );
  }
}
