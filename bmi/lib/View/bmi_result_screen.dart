import 'package:bmi/View/bmi_data_screen.dart';
import 'package:bmi/contant/contant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class bmiresultscreen extends StatelessWidget {
  const bmiresultscreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  //final BmiCalculator bmiCalculator;

  // String determineBmiCategory(double bmivalue) {
  //   String category = "";
  //   if (bmivalue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmivalue < 17) {
  //     category = underweightModerate;
  //   } else if (bmivalue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmivalue < 25) {
  //     category = normal;
  //   } else if (bmivalue < 30) {
  //     category = overweight;
  //   } else if (bmivalue < 35) {
  //     category = obeseI;
  //   } else if (bmivalue < 40) {
  //     category = obeseII;
  //   } else if (bmivalue >= 40) {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis.";
  //       break;
  //     case normal:
  //       desc = "Low risk (healthy range).";
  //       break;
  //     case overweight:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High risk of developing heart disease, low blood pressure, stroke,diabetes mellitus, metabolic Syndrome.";
  //       break;
  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory =
    bmiCalculator.determineBmiCategory();
    //final bmiDesc =
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Text(
              "Hasil Perhitungan",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //(bmiCalculator.bmiCategory ?? ""
                  Text(bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text(bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Text(bmiCalculator.bmiDescription ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
            color: const Color(0xffEC3C66),
            child: const Center(
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
