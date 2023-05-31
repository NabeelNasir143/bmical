import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var incheController = TextEditingController();
  var result = '';
  var bgColor = Colors.limeAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI APP'),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI INFO',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 21),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Youre Weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(height: 11),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Youre Weight (in Feet)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(height: 11),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: incheController,
                  decoration: InputDecoration(
                    label: Text('Enter Youre Weight (in Feet)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(height: 11),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inches = incheController.text.toString();
                      if (wt != '' && ft != '' && inches != '') {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iIn = int.parse(inches);

                        var tInches = (ift * 12) + iIn;
                        var tCm = tInches * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);
                        var msg = '';
                        if (bmi > 25) {
                          msg = 'your are overAge ';
                          bgColor = Colors.cyanAccent;
                        } else if (bmi < 18) {
                          msg = 'your are UnderAge ';
                          bgColor = Colors.lightBlueAccent;
                        } else {
                          msg = 'your are Healty ';
                          bgColor = Colors.yellowAccent;
                        }

                        setState(() {
                          result =
                              '$msg \n your Bmi Is ${bmi.toStringAsFixed(3)}';
                        });
                      } else {
                        setState(() {
                          result = 'Please Fill The Required Fields';
                        });
                      }
                    },
                    child: Text('Click Here')),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
