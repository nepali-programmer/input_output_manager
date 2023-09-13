import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:input_output_manager/input_output_manager_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInputOutputManager platform = MethodChannelInputOutputManager();
  const MethodChannel channel = MethodChannel('input_output_manager');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getOutputDevices(), []);
  });
}
