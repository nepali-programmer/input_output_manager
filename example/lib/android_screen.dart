import 'package:flutter/material.dart';
import 'package:input_output_manager/input_output_manager.dart';
import 'package:input_output_manager/model/output_audio_device.dart';

String outputDeviceString = 'Output Devices';
String inputDeviceString = 'Input Devices';

class AndroidScreen extends StatefulWidget {
  const AndroidScreen({super.key});

  @override
  State<AndroidScreen> createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> {
  final InputOutputManager _inputOutputManager = InputOutputManager();

  List<AudioDeviceInformation>? outputDevices;

  AudioDeviceInformation? selectedOutputDevice;

  List<AudioDeviceInformation>? inputDevices;

  final Set<String> selection = <String>{outputDeviceString, inputDeviceString};

  _getAudioDevices() async {
    try {
      final List<AudioDeviceInformation>? audioOutputDevices =
          await _inputOutputManager.getOutputDevices();
      outputDevices = audioOutputDevices;
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android audio devices'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SegmentedButton(
            segments: [
              ButtonSegment<String>(
                value: outputDeviceString,
              ),
              ButtonSegment<String>(
                value: inputDeviceString,
              )
            ],
            selected: selection,
            onSelectionChanged: (value) {
              _getAudioDevices();
            },
            multiSelectionEnabled: false,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: outputDevices?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('id : ${outputDevices?[index].id.toString() ?? ''}'),
                  leading: Text(
                      'Type : ${outputDevices?[index].type.toString() ?? ''}'),
                  subtitle: Text(
                      'Name : ${outputDevices?[index].name.toString() ?? ''}'),
                  trailing: Text(
                      'Address : ${outputDevices?[index].address.toString() ?? ''}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
