import 'package:flutter_test/flutter_test.dart';
import 'package:input_output_manager/input_output_manager.dart';
import 'package:input_output_manager/input_output_manager_platform_interface.dart';
import 'package:input_output_manager/input_output_manager_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInputOutputManagerPlatform
    with MockPlatformInterfaceMixin
    implements InputOutputManagerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InputOutputManagerPlatform initialPlatform = InputOutputManagerPlatform.instance;

  test('$MethodChannelInputOutputManager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInputOutputManager>());
  });

  test('getPlatformVersion', () async {
    InputOutputManager inputOutputManagerPlugin = InputOutputManager();
    MockInputOutputManagerPlatform fakePlatform = MockInputOutputManagerPlatform();
    InputOutputManagerPlatform.instance = fakePlatform;

    expect(await inputOutputManagerPlugin.getPlatformVersion(), '42');
  });
}
