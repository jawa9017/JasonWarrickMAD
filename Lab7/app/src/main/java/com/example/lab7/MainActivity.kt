package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import org.w3c.dom.Text

class MainActivity : AppCompatActivity() {
    lateinit var booText: TextView
    lateinit var imageGhost: ImageView

    var fillingId: Int = -1

    var message: String = ""
    var priceTxt: String = ""

    lateinit var radioGroup: RadioGroup
    lateinit var messageText: TextView
    lateinit var priceText: TextView
    lateinit var checkBox1: CheckBox
    lateinit var checkBox2: CheckBox
    lateinit var checkBox3: CheckBox
    lateinit var spinner: Spinner
    lateinit var layoutRoot: ConstraintLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        messageText = findViewById<TextView>(R.id.messageText)
        priceText = findViewById<TextView>(R.id.priceText)
        checkBox1 = findViewById<CheckBox>(R.id.checkBox1)
        checkBox2 = findViewById<CheckBox>(R.id.checkBox2)
        checkBox3 = findViewById<CheckBox>(R.id.checkBox3)
        spinner = findViewById<Spinner>(R.id.spinner)
        layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)
    }

    fun calcPrice(view: View) {
        var filling : CharSequence = ""
        var concessions = ""
        var price = 0
        fillingId = radioGroup.checkedRadioButtonId

        if (fillingId == -1){
            val fillingSnackbar = Snackbar.make(layoutRoot, "Please select a ticket price", Snackbar.LENGTH_SHORT)
            fillingSnackbar.show()
        } else {
            filling = findViewById<RadioButton>(fillingId).text

            if (fillingId == 0) {
                price += 8
            } else {
                price += 12
            }

            if (checkBox1.isChecked) {
                concessions += " " + checkBox1.text
                price += 5
            }
            if (checkBox2.isChecked) {
                concessions += " " + checkBox2.text
                price += 4
            }
            if (checkBox3.isChecked) {
                concessions += " " + checkBox3.text
                price += 2
            }
            if (concessions.isNotEmpty()) {
                concessions = "with" + concessions
            }

            if (spinner.selectedItem == "1") {
                price *= 1
            } else if (spinner.selectedItem == "2") {
                price *= 2
            } else if (spinner.selectedItem == "3") {
                price *= 3
            } else if (spinner.selectedItem == "4") {
                price *= 4
            } else if (spinner.selectedItem == "5") {
                price *= 5
            }

            message = "You'd like a $filling ticket $concessions"
            priceTxt = price.toString()

            updateUI()
        }

    }

    fun updateUI() {
        messageText.text = message
        priceText.text = priceTxt
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
        outState.putString("price", priceTxt)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        priceTxt = savedInstanceState.getString("price", "")
        updateUI()
    }
}