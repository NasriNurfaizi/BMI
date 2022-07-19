import 'package:bmi/contant/contant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double calculateBMI() {
    double heightInMeter = height! / 100;
    //final h = pow(height, 2);
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;
    return bmi!;
  }

  String determineBmiCategory(double bmivalue) {
    String category = "";
    if (bmivalue < 16.0) {
      category = underweightSevere;
    } else if (bmivalue < 17) {
      category = underweightModerate;
    } else if (bmivalue < 18.5) {
      category = underweightMild;
    } else if (bmivalue < 25) {
      category = normal;
    } else if (bmivalue < 30) {
      category = overweight;
    } else if (bmivalue < 35) {
      category = obeseI;
    } else if (bmivalue < 40) {
      category = obeseII;
    } else if (bmivalue >= 40) {
      category = obeseIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, low blood pressure, stroke,diabetes mellitus, metabolic Syndrome.";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
