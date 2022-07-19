//import 'dart:html';
//import 'dart:math';
//import 'dart:ui';

import 'package:bmi/contant/contant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_result_screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types
class bmidatascreen extends StatefulWidget {
  const bmidatascreen({Key? key}) : super(key: key);

  @override
  State<bmidatascreen> createState() => _bmidatascreenState();
}

// ignore: camel_case_types
class _bmidatascreenState extends State<bmidatascreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBMI() {
  //   double heightInMeter = height / 100;
  //final h = pow(height, 2);
  //   final h = (heightInMeter * heightInMeter);
  //   final bmi = weight / h;
  //   return bmi;
  // }

  // eror BMICARD untuk format usia dan berat
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0A0E21),
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        gender = "male";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor:
                            (gender == "male") ? Colors.white : primaryColor,
                        child: const GenderIconText(
                            icon: Icons.male, title: 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        gender = "female";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor:
                            (gender == "female") ? Colors.white : primaryColor,
                        child: const GenderIconText(
                            icon: Icons.female, title: 'Female'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labeltextstyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labeltextstyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labeltextstyle,
                          ),
                          Text("$weight", style: numberTextStyle),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  weight += 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212427),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              RawMaterialButton(
                                onPressed: () {
                                  weight -= 1;
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212427),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labeltextstyle,
                          ),
                          Text("$age", style: numberTextStyle),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  age += 1;
                                  //age++; opsi lain
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212427),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              RawMaterialButton(
                                onPressed: () {
                                  age -= 1;
                                  //age--; other option
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212427),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //  Print(calculateBMI());
                final bmiCalculator =
                    BmiCalculator(height: height, weight: weight);
                bmiCalculator.calculateBMI();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return bmiresultscreen(
                        bmi: bmiCalculator.bmi!,
                      );
                    }),
                  ),
                );
              },
              child: Container(
                height: 60,
                color: const Color(0xffEC3C66),
                child: const Center(
                    child: Text(
                  "Hitung BMI",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    required this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xff111328),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor)),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(title, style: labeltextstyle),
      ],
    );
  }
}
