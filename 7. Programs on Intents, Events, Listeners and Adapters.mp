1 Create another activity (i.e. SecondActivity) right click on java/kotlin --> new --> activity -->  Empty Activity --> enetr name "Second"

1. activity_main.xml:

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
        android:id="@+id/mytext"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:inputType="textPersonName"
        android:hint="Enter your message"
        android:layout_marginTop="20dp"
        android:minHeight="48dp"/>

    <Button
        android:id="@+id/send"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="send"
        android:layout_marginTop="20dp"
        android:layout_gravity="center_horizontal"/>

</LinearLayout>


2. activity_second.xml :

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".Second">

    <TextView
        android:id="@+id/display"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_weight="1"
        android:text="TextView"
        android:layout_marginTop="40dp"/>
</LinearLayout>


3. MainActivity.kt :

package com.example.practical7_intents_event_listeners_adapters

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import java.util.Objects

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val message = findViewById<EditText>(R.id.mytext)
        val btn_send = findViewById<Button>(R.id.send)
        btn_send.setOnClickListener(object: View.OnClickListener {
            override fun onClick(v: View?){
                val intent = Intent(applicationContext, Second::class.java)
                intent.putExtra("msg",message.text.toString())
                startActivity(intent)
            }
        })

    }
}


4. Second.kt:

package com.example.practical7_intents_event_listeners_adapters

import android.os.Bundle
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class Second : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        val text_display= findViewById<TextView>(R.id.display)
        text_display.setText(intent.extras?.getString("msg"))
    }
}
