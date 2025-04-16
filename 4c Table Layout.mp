1. activity_main.xml:

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">
    <TableLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:id="@+id/tablelaout"
        android:orientation="vertical"
        android:padding="16dp"
        android:layout_marginTop="150dp"
        android:layout_marginLeft="50dp"
        android:layout_centerInParent="true">

        <TableRow
            android:layout_width="match_parent"
            android:layout_height="wrap_content">
            <Button
                android:id="@+id/button1"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Button 1"/>

<!--                android:onClick="onButtonClick"-->


            <Button
                android:id="@+id/button2"
                android:text="Button 2"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"/>

<!--                android:onClick="onButtonClick"-->
            <Button
                android:id="@+id/button3"
                android:text="Button 3"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"/>
<!--                android:onClick="onButtonClick"-->

        </TableRow>



        <TableRow
            android:layout_width="match_parent"
            android:layout_height="wrap_content">
            <Button
                android:id="@+id/button4"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="botton 4"/>

<!--                android:onClick="onButtonClick"-->
            <Button
                android:id="@+id/button5"
                android:text="Button 5"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                />
<!--                android:onClick="onButtonClick"-->

            <Button
                android:id="@+id/button6"
                android:text="Button 6"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                />
<!--                android:onClick="onButtonClick"-->

        </TableRow>





        <TableRow
            android:layout_width="match_parent"
            android:layout_height="wrap_content">
            <Button
                android:id="@+id/button7"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="botton 7"/>
<!--                android:onClick="onButtonClick"-->
            <Button
                android:id="@+id/button8"
                android:text="Button 8"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"/>
<!--                android:onClick="onButtonClick"-->
            <Button
                android:id="@+id/button9"
                android:text="Button 9"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"/>
<!--                android:onClick="onButtonClick"-->

        </TableRow>

    </TableLayout>
</LinearLayout>



2.MainActivity.kt:

package com.example.practical4tablelayout

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import android.widget.Toast


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val button1: Button = findViewById(R.id.button1)
        val button2: Button = findViewById(R.id.button2)
        val button3: Button = findViewById(R.id.button3)
        val button4: Button = findViewById(R.id.button4)
        val button5: Button = findViewById(R.id.button5)
        val button6: Button = findViewById(R.id.button6)
        val button7: Button = findViewById(R.id.button7)
        val button8: Button = findViewById(R.id.button8)
        val button9: Button = findViewById(R.id.button9)

        button1.setOnClickListener {  onButtonClick(1)}
        button2.setOnClickListener {  onButtonClick(2)}
        button3.setOnClickListener {  onButtonClick(3)}
        button4.setOnClickListener {  onButtonClick(4)}
        button5.setOnClickListener {  onButtonClick(5)}
        button6.setOnClickListener {  onButtonClick(6)}
        button7.setOnClickListener {  onButtonClick(7)}
        button8.setOnClickListener {  onButtonClick(8)}
        button9.setOnClickListener {  onButtonClick(9)}

    }
    private fun onButtonClick(buttonNumber: Int)
    {
        Toast.makeText(this,"Button $buttonNumber clicked", Toast.LENGTH_SHORT).show()
    }
}
