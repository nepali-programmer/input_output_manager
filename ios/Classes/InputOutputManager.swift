import Foundation
import Flutter

class InputOutputManager {
    func getOutputDevices(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let data = [
            ["id": 1, "name": "Name of Device 1", "address": "1:2:3", "type": 2],
            ["id": 2, "name": "Name of Device 2", "address": "1:2:3", "type": 23],
            ["id": 3, "name": "Name of Device 3", "address": "1:2:3", "type": 3],
        ]
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        return jsonString
    }
}
