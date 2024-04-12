import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedGender = 0, height = 20, age = 1, weight = 20;
  String chickBMI = 'nice';
  double bmi = 0;
  String _getBMIStatus(double bmi) {
    // Implement your BMI status classification logic here
    // Return appropriate message based on the BMI value
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color _getProgressColor(double bmi) {
    // Customize the colors based on your preference
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 24.9) {
      return Colors.green;
    } else if (bmi < 39.9) {
      return Colors.orange; // Example: Orange for overweight
    } else {
      return Colors.red; // Example: Red for obese
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(103, 159, 14, 185),
        title: Center(
            child: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        )),
        toolbarHeight: 90,
      ),
      body: _buildUI(),
      floatingActionButton: Container(
        width: 115,
        child: FloatingActionButton(
          shape: const BeveledRectangleBorder(
              side: BorderSide(
            color: Colors.black12,
            width: 2,
          )),
          onPressed: () {
            setState(() {
              bmi = weight / ((height / 100) * (height / 100));
            });
          },
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                Icon(
                  Icons.calculate,
                  size: 30,
                ),
                Text(
                  "Calculate",
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        gender(),
        SizedBox(
          height: 10.h,
        ),
        heightInput(),
        SizedBox(height: 10.h),
        weight_age(),
        // SizedBox(
        //   height: 30,
        // ),
        bmi_result(),
        // check(),
        colors_check(),
        check(),
      ],
    );
  }

  Widget heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Column(children: [
        Text(
          "Height",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Slider(
            min: 0,
            max: 200,
            divisions: 200,
            value: height.toDouble(),
            onChanged: (value) {
              setState(() {
                height = value.toInt();
              });
            }),
        Text(
          "Your Height=$height cm",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  Widget gender() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 0;
                  });
                },
                icon: Icon(Icons.male),
                color: selectedGender == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                iconSize: 60,
              ),
              Text(
                "man",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 1;
                  });
                },
                icon: Icon(Icons.female),
                color: selectedGender == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                iconSize: 60,
              ),
              Text(
                "woman",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget weight_age() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 13),
            child: Column(
              children: [
                Text(
                  "Weight",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ItemCount(
                    textStyle:
                        TextStyle(fontSize: 1, fontWeight: FontWeight.bold),
                    buttonSizeHeight: 30,
                    buttonSizeWidth: 50,
                    initialValue: weight,
                    minValue: 0,
                    maxValue: 200,
                    onChanged: (value) {
                      setState(() {
                        weight = value.toInt();
                      });
                    },
                    decimalPlaces: 00),
              ],
            )),
        const SizedBox(
          width: 60,
        ),
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Age",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ItemCount(
                    textStyle:
                        TextStyle(fontSize: 1, fontWeight: FontWeight.bold),
                    buttonSizeHeight: 30,
                    buttonSizeWidth: 50,
                    initialValue: age,
                    minValue: 0,
                    maxValue: 200,
                    onChanged: (value) {
                      setState(() {
                        age = value.toInt();
                      });
                    },
                    decimalPlaces: 00),
              ],
            )),
      ],
    );
  }

  Widget bmi_result() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        "BMI result = ${bmi.toStringAsFixed(1)}",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
      ),
    );
  }

  Widget check() {
    return Container(
      // decoration: BoxDecoration(
      //   color: Theme.of(context).colorScheme.primaryContainer,
      //   borderRadius: BorderRadius.circular(15),
      // ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: CircularPercentIndicator(
        animation: true,
        radius: 80,
        lineWidth: 20,
        percent: (bmi / 100),
        progressColor: _getProgressColor(bmi),
        //  bmi <= 18.4 ? Colors.yellow : Color.fromARGB(255, 36, 176, 11),
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "${(bmi).toStringAsFixed(1)}%",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget colors_check() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.blue,
            ),
            Text("Underweight"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.orange,
            ),
            Text("Overweight"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.green,
            ),
            Text("Normal"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.red,
            ),
            Text("Obese"),
          ],
        ),
      ],
    );
  }
}
