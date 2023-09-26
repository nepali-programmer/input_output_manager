package np.com.joshisijan.input_output_manager

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.util.Log

class AudioController {

    companion object {
        const val TAG="AudioController"
    }

    fun setSpeakerOn(context: Context){

         try{

            val audioManager: AudioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
             audioManager.isSpeakerphoneOn = true;

        } catch (e: Exception){
            Log.d(InputOutputDevices.TAG, e.toString())
        }

    }



}