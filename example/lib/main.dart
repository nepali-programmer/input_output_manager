import 'dart:io';

import 'package:flutter/material.dart';
import 'package:input_output_manager_example/android_screen.dart';
import 'package:input_output_manager_example/ios_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Platform.isAndroid ? const AndroidScreen() : const IosScreen(),
    );
  }
}
