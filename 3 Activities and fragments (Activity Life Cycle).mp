Q2. Programming Activities and fragments: Activity Life Cycle, Activity methods, Multiple Activities, Life Cycle of fragments and multiple fragments


STEP 1: right click on 'com.example.myapplication' --> new --> kotlin class/file --> "AboutUS" name --> select class

1 activity_main.xml:

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

<!--    <TextView-->
<!--        android:layout_width="wrap_content"-->
<!--        android:layout_height="wrap_content"-->
<!--        android:text="Hello World!"-->
<!--        app:layout_constraintBottom_toBottomOf="parent"-->
<!--        app:layout_constraintEnd_toEndOf="parent"-->
<!--        app:layout_constraintStart_toStartOf="parent"-->
<!--        app:layout_constraintTop_toTopOf="parent" />-->


    <Button
        android:id="@+id/about_us"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerHorizontal="true"
        android:layout_marginTop="80dp"
        android:text="AboutUS" />
</RelativeLayout>



2. androidmanifest.xml:

<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application
        android:allowBackup="true"
        android:dataExtractionRules="@xml/data_extraction_rules"
        android:fullBackupContent="@xml/backup_rules"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.Practical3"
        tools:targetApi="31">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <activity android:name=".AboutUS"/>
    </application>

</manifest>


3 mainActivity.kt:

package com.example.practical3

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    val TAG = "Main Activity"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        Log.d(TAG,"IN OnCreate")
        val about_us = findViewById<Button>(R.id.about_us)
        about_us.setOnClickListener {
            val i = Intent(this , AboutUS::class.java)
            startActivity(i)
        }
    }

    override fun onStart() {
            super.onStart()
        Log.d(TAG,"In OnStart")
    }

    override fun onStop() {
        super.onStop()
        Log.d(TAG,"In OnStop")
    }

    override fun onPause() {
        super.onPause()
        Log.d(TAG,"In OnPause")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d(TAG,"In OnDestroy")
    }

    override fun onRestart() {
        super.onRestart()
        Log.d(TAG,"In OnRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG,"In OnResume")
    }
}


4. aboutUS.xml:

package com.example.practical3

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class AboutUS:AppCompatActivity() {
    val TAG = "About US"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d(TAG,"inside oncreate")
        Toast.makeText(this,"you are under about us", Toast.LENGTH_LONG).show()
    }
    override fun onStart() {
        super.onStart()
        Log.d(TAG,"In OnStart")
    }

    override fun onStop() {
        super.onStop()
        Log.d(TAG,"In OnStop")
    }

    override fun onPause() {
        super.onPause()
        Log.d(TAG,"In OnPause")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d(TAG,"In OnDestroy")
    }

    override fun onRestart() {
        super.onRestart()
        Log.d(TAG,"In OnRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG,"In OnResume")
    }
}

