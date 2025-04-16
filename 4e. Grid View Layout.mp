1. activity_main.xml:

<?xml version="1.0" encoding="utf-8"?>
<GridLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity"
    android:rowCount="3"
    android:columnCount="3"
    android:padding="20dp"
    android:layout_marginTop="150dp"
    android:layout_marginLeft="20dp"
    >


    <Button
        android:id="@+id/button"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="0"
        android:layout_column="0"
        android:text="1" />

    <Button
        android:id="@+id/button2"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="0"
        android:layout_column="1"
        android:text="2" />

    <Button
        android:id="@+id/button3"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="1"
        android:layout_column="1"
        android:text="3" />

    <Button
        android:id="@+id/button4"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="0"
        android:layout_column="2"
        android:text="4" />

    <Button
        android:id="@+id/button6"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="1"
        android:layout_column="0"
        android:text="5" />

    <Button
        android:id="@+id/button7"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="1"
        android:layout_column="2"
        android:text="6" />

    <Button
        android:id="@+id/button8"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="2"
        android:layout_column="0"
        android:text="7" />

    <Button
        android:id="@+id/button9"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="2"
        android:layout_column="1"
        android:text="8" />

    <Button
        android:id="@+id/button10"
        android:layout_width="110dp"
        android:layout_height="100dp"
        android:layout_row="2"
        android:layout_column="2"
        android:text="9" />
</GridLayout>


2. MainActivity.kt:

package com.example.practical4gridview

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
}
