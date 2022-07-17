import 'package:bmi/View/bmi_data_screen.dart';
import 'package:bmi/contant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bmiresultscreen extends StatelessWidget {
  const bmiresultscreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  determineBmiCategory(double bmivalue) {
    String category = "";
    if (bmivalue < 16.0) {
      category = underweightSevere;
    }
    if (bmivalue >= 16.0 && bmivalue < 17) {
      category = underweightModerate;
    }
    if (bmivalue >= 17 && bmivalue < 18.5) {
      category = underweightMild;
    }
    if (bmivalue >= 18.5 && bmivalue < 25) {
      category = normal;
    }
    if (bmivalue >= 25 && bmivalue < 30) {
      category = overweight;
    }
    if (bmivalue >= 30 && bmivalue < 35) {
      category = obeseI;
    }
    if (bmivalue >= 35 && bmivalue < 40) {
      category = obeseII;
    }
    if (bmivalue > 40) {
      category = obeseIII;
    }

    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
              child: Center(
            child: Text(
              "Hasil Perhitungan",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(determineBmiCategory(bmi),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text("${bmi.toStringAsFixed(1)}",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text("Your BMI Result is quaite low,you should eat more!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 60,
            color: Color(0xffEC3C66),
            child: Center(
                child: Text(
              "Hitung Ulang",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
          ),
        )
      ]),
    );
  }
}
