Go to java(com.example.ui_pro) -> New -> Activity -> Empty Activity -> give name "LoginActivity" -> click finish.


1. activity_main.xml :

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/name"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Welcome to Our APP"
        android:layout_centerHorizontal="true"
        android:textColor="@color/white"
        android:background="@color/pink"
        android:layout_marginTop="160dp"
        android:textSize="30dp"/>
<!--    android:fontFamily="@font/arapey"-->

    <Button
        android:id="@+id/login"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_below="@id/name"
        android:layout_margin="20dp"
        android:fontFamily="serif"
        android:textAlignment="center"
        android:textSize="20dp"
        android:textAllCaps="true"
        android:text="login" />

    <Button
        android:id="@+id/register"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_below="@id/login"
        android:layout_margin="20dp"
        android:fontFamily="serif"
        android:textAlignment="center"
        android:textSize="20dp"
        android:textAllCaps="true"
        android:text="register" />

</RelativeLayout>


2. MainActivity.kt:

package com.example.practical5_ui_elemet

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val loginbtn: Button = findViewById(R.id.login)
        val registerbtn: Button = findViewById(R.id.register)
        loginbtn.setOnClickListener {
            val intent = Intent(this , LoginActivity::class.java)
            startActivity(intent)

        }
        registerbtn.setOnClickListener {
            val intent = Intent(this , register::class.java)
            startActivity(intent)
        }
    }
}


3.LoginActivit.kt:

package com.example.practical5_ui_elemet

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_login)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}

4. Activity_login.xml:

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".LoginActivity">
    <TextView

        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Welcome to Login APP"
        android:background="@color/black"
        android:layout_centerInParent="true"
        android:textSize="30dp"/>

</RelativeLayout>


5. Activity_register.xml:

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".register">
    <TextView

        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Welcome to register APP"
        android:background="@color/black"
        android:layout_centerInParent="true"
        android:textColor="@color/white"
        android:textSize="30dp"/>
</RelativeLayout>
