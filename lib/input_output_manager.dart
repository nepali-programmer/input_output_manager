import 'package:input_output_manager/model/output_audio_device.dart';

import 'input_output_manager_platform_interface.dart';

class InputOutputManager {
  Future<List<AudioDeviceInformation>?> getOutputDevices() async {
    return await InputOutputManagerPlatform.instance.getOutputDevices();
  }
}
