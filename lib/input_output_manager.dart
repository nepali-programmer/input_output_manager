
import 'input_output_manager_platform_interface.dart';

class InputOutputManager {
  Future<String?> getPlatformVersion() {
    return InputOutputManagerPlatform.instance.getPlatformVersion();
  }
}
