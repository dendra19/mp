1 Expand res folder --> select layout Folder --> right click on layout folder --> select new --> select Android Resource File --> give name to the file “dialog_fragments”.
2 Now go to java folder & expand it --> right click on com.example.frag --> select new --> select Kotlin file class and give name as “Myfragment” and select kind as “class” --> click Ok.


1. MainActivity.kt:

package com.example.practical6dialog_framents

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.fragment.app.FragmentManager

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        val fm: FragmentManager = supportFragmentManager
        val myFragment = MyFragment()
        myFragment.show(fm,"simple fragment")
    }
}


2. activity_main.xml :

<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>


3. dialog_fragments.xml:

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
             android:layout_width="match_parent"
             android:layout_height="match_parent">
    <RelativeLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="50dp">
        <RadioGroup
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical"
            android:id="@+id/myradiogroup"
            android:padding="10dp">
            <RadioButton
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Excellent"
                android:checked="false"
                android:id="@+id/radioButton1"/>
            <RadioButton
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Very Good"
                android:checked="false"
                android:id="@+id/radioButton2"/>
            <RadioButton
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Good"
                android:checked="false"
                android:id="@+id/radioButton3"/>
            <RadioButton
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Avarage"
                android:checked="false"
                android:id="@+id/radioButton4"/>
            <RadioButton
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Bad"
                android:checked="false"
                android:id="@+id/radioButton5"/>

            <Button
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:text="Submit"
                android:id="@+id/submitButton"/>

            <Button
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:text="cancel"
                android:id="@+id/cancelButton"/>

        </RadioGroup>
    </RelativeLayout>
</RelativeLayout>


4.Myfragment.kt:

package com.example.practical6dialog_framents

import android.os.Bundle  // This import was missing
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.RadioButton
import android.widget.RadioGroup
import android.util.Log
import androidx.fragment.app.DialogFragment

class MyFragment : DialogFragment() { // Class name should be PascalCase (MyFragment)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val rootView: View = inflater.inflate(R.layout.dialog_fragments, container, false)

        val cancelButton = rootView.findViewById<Button>(R.id.cancelButton)
        val submitButton = rootView.findViewById<Button>(R.id.submitButton)
        val surveyRadioGroup = rootView.findViewById<RadioGroup>(R.id.myradiogroup)

        cancelButton.setOnClickListener {
            dismiss()
        }

        submitButton.setOnClickListener {
            val selectedId = surveyRadioGroup.checkedRadioButtonId
            if (selectedId != -1) {
                val selectedRadioButton = rootView.findViewById<RadioButton>(selectedId)
                Log.d("test", selectedRadioButton.text.toString())
            } else {
                Log.d("test", "No option selected")
            }
            dismiss()
        }

        return rootView
    }
}











