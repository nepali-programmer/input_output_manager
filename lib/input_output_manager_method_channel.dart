import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'input_output_manager_platform_interface.dart';

/// An implementation of [InputOutputManagerPlatform] that uses method channels.
class MethodChannelInputOutputManager extends InputOutputManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('input_output_manager');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
