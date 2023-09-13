import 'package:input_output_manager/model/output_audio_device.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'input_output_manager_method_channel.dart';

abstract class InputOutputManagerPlatform extends PlatformInterface {
  /// Constructs a InputOutputManagerPlatform.
  InputOutputManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static InputOutputManagerPlatform _instance =
      MethodChannelInputOutputManager();

  /// The default instance of [InputOutputManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelInputOutputManager].
  static InputOutputManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InputOutputManagerPlatform] when
  /// they register themselves.
  static set instance(InputOutputManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<List<AudioDeviceInformation>?> getOutputDevices();
  Future<List<AudioDeviceInformation>?> getInputDevices();
}
