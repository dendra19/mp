1 MainActivity.kt:

package com.example.calculator

import android.os.Bundle
import android.widget.*
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    private lateinit var etNum1: EditText
    private lateinit var etNum2: EditText
    private lateinit var tvResult: TextView
    private lateinit var btnAdd: Button
    private lateinit var btnSub: Button
    private lateinit var btnMul: Button
    private lateinit var btnDiv: Button

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        etNum1 = findViewById(R.id.etNum1)
        etNum2 = findViewById(R.id.etNum2)
        tvResult = findViewById(R.id.tvResult)
        btnAdd = findViewById(R.id.btnAdd)
        btnSub = findViewById(R.id.btnSub)
        btnMul = findViewById(R.id.btnMul)
        btnDiv = findViewById(R.id.btnDiv)

        btnAdd.setOnClickListener {
            performOperation(Operation.ADD)
        }

        btnSub.setOnClickListener {
            performOperation(Operation.SUB)
        }

        btnMul.setOnClickListener {
            performOperation(Operation.MUL)
        }

        btnDiv.setOnClickListener {
            performOperation(Operation.DIV)
        }
    }
    private fun performOperation(operation: Operation) {
        val num1Str = etNum1.text.toString()
        val num2Str = etNum2.text.toString()

        if (num1Str.isEmpty() || num2Str.isEmpty()) {
            tvResult.text = "Please enter both numbers"
            return
        }

        val num1 = num1Str.toDouble()
        val num2 = num2Str.toDouble()

        val result = when (operation) {
            Operation.ADD -> num1 + num2
            Operation.SUB -> num1 - num2
            Operation.MUL -> num1 * num2
            Operation.DIV -> if (num2 != 0.0) num1 / num2 else {
                tvResult.text = "Cannot divide by zero"
                return
            }
        }

        tvResult.text = "Result: $result"
    }

    enum class Operation {
        ADD, SUB, MUL, DIV
    }
}



2. activity_main.xml :

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="24dp"
    android:gravity="center_horizontal"
    tools:context=".MainActivity">

    <EditText
        android:id="@+id/etNum1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter first number"
        android:inputType="numberDecimal"
        android:layout_marginBottom="8dp" />

    <EditText
        android:id="@+id/etNum2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter second number"
        android:inputType="numberDecimal"
        android:layout_marginBottom="16dp" />

    <TextView
        android:id="@+id/tvResult"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Result:"
        android:textSize="20sp"
        android:layout_marginTop="16dp"
        android:textStyle="bold"
        android:gravity="center" />

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        android:layout_marginTop="24dp"
        android:gravity="center">

        <Button
            android:id="@+id/btnAdd"
            android:text="+"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginEnd="8dp" />

        <Button
            android:id="@+id/btnSub"
            android:text="-"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginEnd="8dp" />

        <Button
            android:id="@+id/btnMul"
            android:text="×"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginEnd="8dp" />

        <Button
            android:id="@+id/btnDiv"
            android:text="÷"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1" />
    </LinearLayout>

</LinearLayout>
