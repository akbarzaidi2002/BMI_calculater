import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Set the background color to white
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.red), // Set text color to red
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red), // Set border color to red
          ),
        ),
      ),
      home: BMICalculator(),
    );
  }
}

enum Gender { Male, Female }

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double heightFeet = 5;
  double heightInches = 6;
  double weight = 70;
  double bmi = 0;
  Gender? selectedGender = Gender.Male;

  void calculateBMI() {
    double heightInCm = (heightFeet * 30.48) + (heightInches * 2.54);
    setState(() {
      bmi = weight / ((heightInCm / 100) * (heightInCm / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' BMI Calculator by Akbar '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 80,
                  color: selectedGender == Gender.Male
                      ? Colors.blue
                      : Colors.pink,
                ),
                SizedBox(width: 20),
                Row(
                  children: <Widget>[
                    Radio(
                      value: Gender.Male,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Male', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: <Widget>[
                    Radio(
                      value: Gender.Female,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    Text('Female', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.height,
                  size: 60,
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Column(
                  children: <Widget>[
                    Text(
                      'Feet:',
                      style: TextStyle(fontSize: 5),
                    ),
                    Slider(
                      value: heightFeet,
                      min: 1,
                      max: 8,
                      onChanged: (newHeight) {
                        setState(() {
                          heightFeet = newHeight;
                        });
                      },
                    ),
                    Text('${heightFeet.toStringAsFixed(0)} feet'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: <Widget>[
                    Text('Inches:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Slider(
                      value: heightInches,
                      min: 0,
                      max: 11,
                      onChanged: (newHeight) {
                        setState(() {
                          heightInches = newHeight;
                        });
                      },
                    ),
                    Text('${heightInches.toStringAsFixed(3)} inches'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.fitness_center,
                  size: 60,
                  color: Colors.orange,
                ),
                SizedBox(width: 20),
                Column(
                  children: <Widget>[
                    Text(
                      'Weight (kg):',
                      style: TextStyle(fontSize: 18),
                    ),
                    Slider(
                      value: weight,
                      min: 30,
                      max: 150,
                      onChanged: (newWeight) {
                        setState(() {
                          weight = newWeight;
                        });
                      },
                    ),
                    Text('$weight kg', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'Your BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

