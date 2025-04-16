1. MainActivity.kt:

package com.example.practical6_dialog
import android.content.DialogInterface
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val submit = findViewById<Button>(R.id.alert)
        submit.setOnClickListener {
            val simplealert = AlertDialog.Builder(this).create()
            simplealert.setTitle("Confirmation")
            simplealert.setMessage("do you want to procees?")
            simplealert.setButton(AlertDialog.BUTTON_POSITIVE, "Yes")
            {
                _:DialogInterface?, which:Int ->
                Toast.makeText(this, "You said yes", Toast.LENGTH_LONG).show()
            }
            simplealert.setButton(AlertDialog.BUTTON_NEGATIVE, "No")
            {
                    _:DialogInterface?, which:Int ->
                Toast.makeText(this, "You said No", Toast.LENGTH_LONG).show()
            }
            simplealert.show()
        }
    }
}


2. activity_main.xml:

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">
    <EditText
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:id="@+id/editTextTextPersonName"
        android:ems="10"
        android:inputType="textPersonName"
        android:text=""
        android:hint="Enter your name"
        android:layout_marginTop="100dp"/>

    <Button
        android:id="@+id/alert"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="submit"
        android:layout_gravity="center"
        android:layout_marginTop="50dp"/>
</LinearLayout>
