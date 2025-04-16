1 Expand res folder --> Right click on res folder --> New --> then select "Android Resource Directory" --> Then Select "R type : menu" --> click ok --> menu folder is created in res folder
2 Now right click on menu folder --> select New --> select Menu Resource File --> then enter "file name : menu " --> ok
3 Then drag & drop 3 Menu Item in menu.xml (design)
4. Now go to values folder --> then expand themes folder --> check both the theme files. 
5. <style name="Base.Theme.MyApplication" parent="Theme.Material3.DayNight.NoActionBar"> conver to <style name="Base.Theme.MyApplication" parent="Theme.Material3.DayNight">
6. NoActionBar word in style tag

1. menu.xml:
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:tools="http://schemas.android.com/tools"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:android="http://schemas.android.com/apk/res/android">

    <item android:title="Item1" android:id="@+id/Item1" />
    <item android:title="Item2" android:id="@+id/Item2"/>
    <item android:title="Item3" android:id="@+id/Item3"/>

</menu>



2. MainActivity.kt:

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







