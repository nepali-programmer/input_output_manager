import 'package:flutter/material.dart';

import 'widget/ios_output_device.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ios Device'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          IosOutputDevice(),
        ],
      ),
    );
  }
}
