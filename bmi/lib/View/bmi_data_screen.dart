import 'dart:html';
import 'dart:ui';

import 'package:bmi/contant/contant.dart';
import 'package:bmi/view/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bmidatascreen extends StatefulWidget {
  const bmidatascreen({Key? key}) : super(key: key);

  @override
  State<bmidatascreen> createState() => _bmidatascreenState();
}

class _bmidatascreenState extends State<bmidatascreen> {
  int height = 100;

  // eror BMICARD untuk format usia dan berat
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0A0E21),
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: BmiCard(
                      child: GenderIconText(icon: Icons.male, title: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: BmiCard(
                      child:
                          GenderIconText(icon: Icons.female, title: 'Female'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                      SizedBox(
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
            ),
            Expanded(
              child: Container(
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
                            Text("60", style: numberTextStyle),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  child: Icon(Icons.add, color: Colors.white),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212427),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                                SizedBox(width: 10),
                                RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212427),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
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
                            Text("20", style: numberTextStyle),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  child: Icon(Icons.add, color: Colors.white),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212427),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                                SizedBox(width: 10),
                                RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212427),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return bmiresultscreen();
                    }),
                  ),
                );
              },
              child: Container(
                height: 60,
                color: Color.fromARGB(255, 12, 63, 139),
                child: Center(child: Text("Hitung BMI")),
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
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xff111328), borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
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
        Icon(icon, size: 80),
        const SizedBox(height: 15),
        Text(title, style: labeltextstyle),
      ],
    );
  }
}
