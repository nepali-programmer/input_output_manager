import Flutter
import UIKit

public class InputOutputManagerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "input_output_manager", binaryMessenger: registrar.messenger())
    let instance = InputOutputManagerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getOutputDevices":      
        let inputOutputManager = InputOutputManager()
        inputOutputManager.getOutputDevices(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
