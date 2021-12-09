package com.example.finalproject

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.AttributeSet
import android.view.ViewGroup
import android.graphics.Color
import android.os.Build
import android.widget.*
import androidx.annotation.RequiresApi
import kotlin.random.Random


class MainActivity : AppCompatActivity() {
    lateinit var block1: TextView
    lateinit var block2: TextView
    lateinit var block3: TextView
    lateinit var block4: TextView
    lateinit var block5: TextView
    lateinit var block6: TextView

    private var r: Int = Random.nextInt(255)
    private var g: Int = Random.nextInt(255)
    private var b: Int = Random.nextInt(255)

    private var rRandom = r / Random.nextInt(1,3)
    private var gRandom = g / Random.nextInt(1,3)
    private var bRandom = b / Random.nextInt(1,3)

    var color1: String = "#FFFFFF"
    var color2: String = "#FFFFFF"
    var color3: String = "#FFFFFF"
    var color4: String = "#FFFFFF"
    var color5: String = "#FFFFFF"
    var color6: String = "#FFFFFF"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        block1 = findViewById(R.id.block1)
        block2 = findViewById(R.id.block2)
        block3 = findViewById(R.id.block3)
        block4 = findViewById(R.id.block4)
        block5 = findViewById(R.id.block5)
        block6 = findViewById(R.id.block6)

        updateUI(rRandom, gRandom, bRandom)
    }

    private fun checkColor(inColor: Double): Int {
        if (inColor > 255) {
            return 255
        } else {
            return inColor.toInt()
        }
    }

    private fun colorText(block: TextView, r: Int, g: Int, b: Int): TextView {
        if (r > 128 && g > 128 || r > 128 && b > 128 || g > 128 && b > 128) {
            block.setTextColor(Color.parseColor("#000000"))
        } else {
            block.setTextColor(Color.parseColor("#FFFFFF"))
        }

        return block
    }

    @RequiresApi(Build.VERSION_CODES.O)
    fun genClicked(view: android.view.View) {
        r = Random.nextInt(255)
        g = Random.nextInt(255)
        b = Random.nextInt(255)
        rRandom = r / Random.nextInt(1,3)
        gRandom = g / Random.nextInt(1,3)
        bRandom = b / Random.nextInt(1,3)

        updateUI(rRandom, gRandom, bRandom)
    }

    private fun updateUI(rRandom: Int, gRandom: Int, bRandom: Int) {
        color1 = String.format("#%02X%02X%02X", r, g, b) //line taken from https://stackoverflow.com/questions/3607858/convert-a-rgb-color-value-to-a-hexadecimal-string
        color2 = String.format("#%02X%02X%02X", checkColor(r * 1.5), checkColor(g * 1.5), checkColor(b * 1.5))
        color3 = String.format("#%02X%02X%02X", r / 2, g / 2, b / 2)
        color4 = String.format("#%02X%02X%02X", checkColor(r * 3.0), checkColor(g * 1.2), checkColor(b * 2.0))
        color5 = String.format("#%02X%02X%02X", rRandom, gRandom, bRandom)
        color6 = String.format("#%02X%02X%02X", checkColor(r * 3.1), checkColor(g * 4.0), checkColor(b * 5.0))

        block1.setBackgroundColor(Color.parseColor(color1))
        block1 = colorText(block1, r, g, b)
        block1.text = color1
        block2.setBackgroundColor(Color.parseColor(color2))
        block2 = colorText(block2, checkColor(r * 1.5), checkColor(g * 1.5), checkColor(b * 1.5))
        block2.text = color2
        block3.setBackgroundColor(Color.parseColor(color3))
        block3 = colorText(block3, r / 2, g / 2, b / 2)
        block3.text = color3
        block4.setBackgroundColor(Color.parseColor(color4))
        block4 = colorText(block4, checkColor(r * 3.0), checkColor(g * 3.0), checkColor(b * 3.0))
        block4.text = color4
        block5.setBackgroundColor(Color.parseColor(color5))
        block5 = colorText(block5, rRandom, gRandom, bRandom)
        block5.text = color5
        block6.setBackgroundColor(Color.parseColor(color6))
        block6 = colorText(block6, checkColor(r * 5.0), checkColor(g * 5.0), checkColor(b * 5.0))
        block6.text = color6
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        //store the values we will need to update the UI with
        updateUI(rRandom, gRandom, bRandom)
        outState.putString("1", color1)
        outState.putString("2", color2)
        outState.putString("3", color3)
        outState.putString("4", color4)
        outState.putString("5", color5)
        outState.putString("6", color6)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)

        block1.setBackgroundColor(Color.parseColor(savedInstanceState.getString("1")))
        block1 = colorText(block1, r, g, b)
        block1.text = savedInstanceState.getString("1")
        block2.setBackgroundColor(Color.parseColor(savedInstanceState.getString("2")))
        block2 = colorText(block2, checkColor(r * 1.5), checkColor(g * 1.5), checkColor(b * 1.5))
        block2.text = savedInstanceState.getString("2")
        block3.setBackgroundColor(Color.parseColor(savedInstanceState.getString("3")))
        block3 = colorText(block3, r / 2, g / 2, b / 2)
        block3.text = savedInstanceState.getString("3")
        block4.setBackgroundColor(Color.parseColor(savedInstanceState.getString("4")))
        block4 = colorText(block4, checkColor(r * 3.0), checkColor(g * 3.0), checkColor(b * 3.0))
        block4.text = savedInstanceState.getString("4")
        block5.setBackgroundColor(Color.parseColor(savedInstanceState.getString("5")))
        block5 = colorText(block5, rRandom, gRandom, bRandom)
        block5.text = savedInstanceState.getString("5")
        block6.setBackgroundColor(Color.parseColor(savedInstanceState.getString("6")))
        block6 = colorText(block6, checkColor(r * 5.0), checkColor(g * 5.0), checkColor(b * 5.0))
        block6.text = savedInstanceState.getString("6")
    }
}