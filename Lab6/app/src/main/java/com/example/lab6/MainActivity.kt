package com.example.lab6

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun makeChoice(view: View) {
        val animName = findViewById<EditText>(R.id.inText)
        val animText = findViewById<TextView>(R.id.outText)
        val name = animName.text
        val strName = name.toString()
        val image = findViewById<ImageView>(R.id.imageView)

        if (strName.uppercase() == "Dog".uppercase()) {
            animText.text = "$name is a good choice!"
            image.setImageResource(R.drawable.dog)
        } else if (strName.uppercase() == "Cat".uppercase()) {
            animText.text = "I guess $name works!"
            image.setImageResource(R.drawable.cat)
        } else {
            animText.text = "I don't think $name is a dog or a cat."
        }
    }
}