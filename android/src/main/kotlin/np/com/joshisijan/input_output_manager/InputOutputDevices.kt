package np.com.joshisijan.input_output_manager

import android.annotation.TargetApi
import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.nfc.Tag
import android.os.Build
import android.util.Log

class InputOutputDevices {
    companion object {
        const val TAG="InputOutputDevices"
    }

    fun getOutputAudioDevices(context: Context): Array<AudioDeviceInfo>? {

        return try{

            val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            val outputDevices :Array<AudioDeviceInfo>? =  audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            outputDevices

        } catch (e: Exception){
            Log.d(TAG, e.toString())
            null
        }

    }


    fun getInputAudioDevices(context: Context): Array<AudioDeviceInfo>? {
        return try{
            Log.d(TAG,"getInputDevicesInvoked" )

                val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            Log.d(TAG,"audioManager Instantiated" )
                val inputDevices : Array<AudioDeviceInfo>? =  audioManager.getDevices(AudioManager.GET_DEVICES_INPUTS)

            if (inputDevices != null) {
                for(item in inputDevices){
                    Log.d(TAG, item.toString())
                    Log.d(TAG, item.productName.toString())
                    Log.d(TAG, item.id.toString())
                    Log.d(TAG, item.type  .toString())
                    Log.d(TAG, "**************************")


                }
            }
                Log.d(TAG, inputDevices?.count().toString())
                inputDevices

        }catch (e: Exception){
            Log.d(TAG, e.toString())
            return null

        }

    }


  fun  getCurrentOutputDevice(context: Context){
      val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
      audioManager.isSpeakerphoneOn=true
    }


}
