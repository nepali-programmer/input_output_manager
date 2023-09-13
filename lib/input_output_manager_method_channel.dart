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
    final outputDevices = await methodChannel.invokeMethod('getOutputDevices');
    return outputDevices;
  }

  @override
  Future<List<AudioDeviceInformation>?> getInputDevices() async {
    final inputDevices = await methodChannel.invokeMethod('getInputDevices');
    return inputDevices;
  }
}
