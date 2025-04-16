1. activity_main.xml :

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">


    <Button
        android:id="@+id/btn_show"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Show Notification"
        android:layout_centerHorizontal="true"
        android:layout_marginTop="250dp"/>
</RelativeLayout>


2. MainActivity.kt :

//package com.example.practical8_notification

//
//import android.annotation.SuppressLint
//import android.app.Notification
//import android.app.Notification.Builder
//import android.app.NotificationChannel
//import android.app.NotificationManager
//import android.app.PendingIntent
//import android.content.Context
//import android.content.Intent
//import android.graphics.Color
//import android.os.Build
//import android.os.Bundle
//import android.widget.Button
//import androidx.activity.enableEdgeToEdge
//import androidx.appcompat.app.AppCompatActivity
//import androidx.core.view.ViewCompat
//import androidx.core.view.WindowInsetsCompat
//
//class MainActivity : AppCompatActivity() {
//    lateinit var notificationManager: NotificationManager
//    lateinit var notificationChannel: NotificationChannel
//    lateinit var builder: Notification.Builder
//    val channelId = "com.example.practical8_notification"
//    val description = "My Notification"
//    @SuppressLint("NotificationPermission")
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        enableEdgeToEdge()
//        setContentView(R.layout.activity_main)
//
//        val show = findViewById<Button>(R.id.btn_show)
//        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
//
//        show.setOnClickListener {
//            val intent = Intent(applicationContext, MainActivity::class.java)
//            val pendingIntent = PendingIntent.getActivity(this,0,intent, PendingIntent.FLAG_UPDATE_CURRENT)
//
//            if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
//            {
//                notificationChannel = NotificationChannel(channelId, description, NotificationManager.IMPORTANCE_HIGH)
//                notificationChannel.enableLights(true)
//                notificationChannel.lightColor = Color.RED
//                notificationChannel.enableVibration(true)
//                notificationManager.createNotificationChannel(notificationChannel)
//
//                builder = Notification.Builder(this,channelId)
//                    .setContentTitle("Android")
//                    .setContentText("New Message")
//                    .setSmallIcon(R.mipmap.ic_launcher)
//                    .setContentIntent(pendingIntent)
//            }else
//            {
//
//                builder = Notification.Builder(this)
//                    .setContentTitle("Android")
//                    .setContentText("New Message")
//                    .setSmallIcon(R.mipmap.ic_launcher)
//                    .setContentIntent(pendingIntent)
//            }
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
//            {
//                notificationManager.notify(0,builder.build())
//            }
//        }
//    }
//}


package com.example.practical8_notification

import android.Manifest
import android.annotation.SuppressLint
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {
    lateinit var notificationManager: NotificationManager
    lateinit var notificationChannel: NotificationChannel
    lateinit var builder: NotificationCompat.Builder
    val channelId = "com.example.notification"
    val description = "My Notification"

    @SuppressLint("MissingPermission")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val show = findViewById<Button>(R.id.btn_show)
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        // ✅ **Android 13+ (API 33+) Permission Request**
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.POST_NOTIFICATIONS), 1)
            }
        }

        show.setOnClickListener {
            Log.d("MainActivity", "BUTTON_CLICKED") // ✅ **Debug: Button Click Hotay Ka?**

            val intent = Intent(applicationContext, MainActivity::class.java)
            val pendingIntent = PendingIntent.getActivity(
                this, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE // ✅ Fixed
            )

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                notificationChannel = NotificationChannel(channelId, description, NotificationManager.IMPORTANCE_HIGH)
                notificationChannel.enableLights(true)
                notificationChannel.lightColor = Color.RED
                notificationChannel.enableVibration(true)
                notificationManager.createNotificationChannel(notificationChannel)

                Log.d("MainActivity", "NOTIFICATION_CHANNEL_CREATED") // ✅ **Debug: Channel Banlay Ka?**
            }

            builder = NotificationCompat.Builder(this, channelId)
                .setContentTitle("Android")
                .setContentText("New Message")
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentIntent(pendingIntent)
                .setAutoCancel(true) // ✅ **Click Kelyavar Notification Hide Honar**
                .setPriority(NotificationCompat.PRIORITY_HIGH) // ✅ **High Priority Notification**

            notificationManager.notify(0, builder.build())
            Log.d("MainActivity", "NOTIFICATION_SENT") // ✅ **Debug: Notify Call Zalay Ka?**
        }
    }
}
