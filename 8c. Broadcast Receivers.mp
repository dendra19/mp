Step 1: Select “com.eample.broadcast”-> New-> select Kotlin Class File-> give name “MyReceiver”-> then select class-> press enter.

1 MyReceiver.kt:

package com.example.practical8_broadcast_receivers

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Settings
import android.widget.Toast

class MyReceiver:BroadcastReceiver()
{
    override fun onReceive(context: Context, intent: Intent)
    {
        if(isAirplaneModeOn(context)){
            Toast.makeText(context,"Airplane Mode is On",Toast.LENGTH_SHORT).show()
        }
        else
        {
            Toast.makeText(context,"Airplane Mode is Off",Toast.LENGTH_SHORT).show()

        }
    }
    private fun isAirplaneModeOn(context: Context):Boolean
    {
        return Settings.Global.getInt(context.contentResolver, Settings.Global.AIRPLANE_MODE_ON, 0) !=0
    }
}


2. MainActivity.kt:

package com.example.practical8_broadcast_receivers

import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.NotificationManagerCompat.InterruptionFilter
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    private  val receiver = MyReceiver()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

    }

    override fun onStart() {
        super.onStart()
        val filter = IntentFilter(Intent.ACTION_AIRPLANE_MODE_CHANGED)
        registerReceiver(receiver, filter)
    }

    override fun onStop() {
        super.onStop()
        unregisterReceiver(receiver)
    }

}


