import 'package:flutter/material.dart';
import 'package:input_output_manager/input_output_manager.dart';
import 'package:input_output_manager/model/output_audio_device.dart';

class IosOutputDevice extends StatefulWidget {
  const IosOutputDevice({super.key});

  @override
  State<IosOutputDevice> createState() => _IosOutputDeviceState();
}

class _IosOutputDeviceState extends State<IosOutputDevice> {
  List<AudioDeviceInformation> list = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: const Text('Get output device'),
          onPressed: () {
            InputOutputManager().getOutputDevices();
          },
        ),
      ],
    );
  }
}
