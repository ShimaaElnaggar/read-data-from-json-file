import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:read_data_from_json_file/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      //theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Read From Json',
      home: const HomeView(),
    );
  }
}
