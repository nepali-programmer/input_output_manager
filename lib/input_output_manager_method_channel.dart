import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:input_output_manager/model/output_audio_device.dart';

import 'input_output_manager_platform_interface.dart';

/// An implementation of [InputOutputManagerPlatform] that uses method channels.
class MethodChannelInputOutputManager extends InputOutputManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('input_output_manager');

  @override
  Future<List<AudioDeviceInformation>?> getOutputDevices() async {
    const String TAG = "AUDIO MANAGER DART";
    try {
      final outputDevicesJson =
          await methodChannel.invokeMethod('getOutputDevices');
      try {
        if (outputDevicesJson != null) {
          final outputDevicesList = jsonDecode(outputDevicesJson);
          print(TAG + outputDevicesList.toString());
          final List<AudioDeviceInformation> outputDevices =
              outputDevicesList.map((deviceJson) {
            return AudioDeviceInformation.fromJson(deviceJson);
          }).toList();
          print('${TAG}json parsed $outputDevices');
          return outputDevices;
        } else {
          return null;
        }
      } catch (e) {
        print('This is exception in dart part $e');
      }
    } catch (e) {
      print(TAG + "Got exception during invoke method");
    }
  }

  @override
  Future<List<AudioDeviceInformation>?> getInputDevices() async {
    final inputDevices = await methodChannel.invokeMethod('getInputDevices');
    return inputDevices;
  }
}
