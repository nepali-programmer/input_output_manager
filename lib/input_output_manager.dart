import 'package:input_output_manager/model/output_audio_device.dart';

import 'input_output_manager_platform_interface.dart';

class InputOutputManager {
  Future<List<OutputAudioDecice>?> getOutputDevices() {
    return InputOutputManagerPlatform.instance.getOutputDevices();
  }
}
