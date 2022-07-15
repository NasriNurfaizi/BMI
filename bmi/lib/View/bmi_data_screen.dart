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
                    child: Bmicard(
                      child: GenderIconText(icon: Icons.male, title: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: Bmicard(
                      child:
                          GenderIconText(icon: Icons.female, title: 'Female'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Color.fromARGB(255, 2, 255, 255),
            )),
            Expanded(child: Container(color: Color.fromARGB(255, 12, 134, 22))),
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
                color: Color.fromARGB(255, 198, 250, 10),
                child: Center(child: Text("Hitung BMI")),
              ),
            )
          ],
        ));
  }
}

class Bmicard extends StatelessWidget {
  const Bmicard({
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
        Text(title, style: gendertextstyle),
      ],
    );
  }
}
