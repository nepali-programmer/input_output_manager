package np.com.joshisijan.input_output_manager

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import android.content.Context
import android.media.AudioDeviceInfo
import android.util.Log
import com.google.gson.Gson


/** InputOutputManagerPlugin */
class InputOutputManagerPlugin: FlutterPlugin,   MethodCallHandler {
  companion object {
    const val TAG="InputOutputManagerPlugin"
  }
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context
  val inputOutputDevices : InputOutputDevices = InputOutputDevices()


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "input_output_manager")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext

  }

  override fun onMethodCall(call: MethodCall, result: Result<Any?>) {
    when (call.method) {
        "getOutputDevices" -> {
          val outputDevices : Array<AudioDeviceInfo>? =  inputOutputDevices.getOutputAudioDevices(applicationContext)
          val outputDevicesMap = outputDevices?.map { deviceInfo ->
            mapOf(
              "id" to deviceInfo.id,
              "type" to deviceInfo.type,
              "name" to deviceInfo.productName,


              // Add other properties you want to include
            )
          }
          val gson = Gson()
          val jsonString = gson.toJson(outputDevicesMap)
          Log.d(Companion.TAG, jsonString)
          result.success(outputDevicesMap)
          Log.d(Companion.TAG, "Result Sent")


        }
        "getInputDevices" -> {
          Log.d(Companion.TAG, "Get input devices initiated")
          val inputDevices : Array<AudioDeviceInfo>? =  inputOutputDevices.getInputAudioDevices(applicationContext)
          Log.d(Companion.TAG, inputDevices.toString())
          result.success(inputDevices.toString())

        }
        else -> {
          result.notImplemented()
        }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }


}
