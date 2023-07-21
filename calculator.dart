import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Home Page'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.jpg',
                width: 220,
              ),
              SizedBox(
                height: 20,
              ),
              buildInputFields(controllerA, 'Nhập vào A'),
              SizedBox(height: 10),
              buildInputFields(controllerB, 'Nhập vào B'),
              SizedBox(height: 20),
              Text(
                'Kết quả là: $result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildCalculationButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputFields(TextEditingController controller, String hintText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {}); // Trigger a rebuild to update the result text
            },
            decoration: InputDecoration(
              labelText: controller.text.isEmpty ? hintText : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCalculationButtons(BuildContext context) {
    const operators = {'+': '+', '-': '-', '*': '*', '%': '%'};

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var operator in operators.keys)
          ElevatedButton(
            onPressed: () => performCalculation(context, operator),
            child: Text(operator),
          ),
        SizedBox(width: 10),
      ],
    );
  }

  void performCalculation(BuildContext context, String operator) {
    double a = double.tryParse(controllerA.text) ?? 0;
    double b = double.tryParse(controllerB.text) ?? 0;

    setState(() {
      if (operator == '+') {
        result = a + b;
      } else if (operator == '-') {
        result = a - b;
      } else if (operator == '*') {
        result = a * b;
      } else if (operator == '%') {
        result = a % b;
      } else {
        result = 0;
      }
    });
  }
}
