import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputController = TextEditingController();
  String outputMessage = '';

  bool isPrime(int n) {
    if (n < 2) {
      return false;
    }
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prime Number Checker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nhập số',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  int n = int.tryParse(inputController.text) ?? 0;
                  bool result = isPrime(n);
                  String message = 'Số $n là ${result ? '' : 'không phải '}số nguyên tố';
                  setState(() {
                    outputMessage = message;
                  });
                },
                child: Text('Kiểm tra'),
              ),
              SizedBox(height: 16),
              Text(
                outputMessage,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}