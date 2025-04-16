1 Expand res folder --> Right click on res folder --> New --> then select "Android Resource Directory" --> Then Select "R type : menu" --> click ok --> menu folder is created in res folder
2 Now right click on menu folder --> select New --> select Menu Resource File --> then enter "file name : menu " --> ok
3 Then drag & drop 3 Menu Item in menu.xml (design)
4. Now go to values folder --> then expand themes folder --> check both the theme files. 

1. MainActivity.kt:

package com.example.practical6menu_dialog

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu, menu) // Inflate your menu.xml
        return true
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.Item1 -> Toast.makeText(this, "Item 1 selected", Toast.LENGTH_SHORT).show()
            R.id.Item2 -> Toast.makeText(this, "Item 2 selected", Toast.LENGTH_SHORT).show()
            R.id.Item3 -> Toast.makeText(this, "Item 3 selected", Toast.LENGTH_SHORT).show()
            else -> return super.onOptionsItemSelected(item)
        }
        return true
    }

}


2. activity_main.xml:

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


3. values\themes.xml :

<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Base.Theme.Practical6Menu_dialog" parent="Theme.Material3.DayNight">
      <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryDark">@color/purple_700</item>
        <item name="colorAccent">@color/teal_200</item>
    </style>

    <style name="Theme.Practical6Menu_dialog" parent="Base.Theme.Practical6Menu_dialog" />
</resources>

4.color.xml:

<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="black">#FF000000</color>
    <color name="white">#FFFFFFFF</color>
    <color name="purple_500">#6200EE</color>
    <color name="purple_700">#3700B3</color>
    <color name="teal_200">#03DAC5</color>
    <color name="teal_700">#018786</color>

</resources>


5.androidManifest.xml:

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
        android:theme="@style/Theme.Practical6Menu_dialog"
        tools:targetApi="31">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

