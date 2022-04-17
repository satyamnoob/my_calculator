import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/calculator_button.dart';

void main() {
  runApp(const MyCalculatorApp());
}

class MyCalculatorApp extends StatefulWidget {
  const MyCalculatorApp({Key? key}) : super(key: key);

  @override
  _MyCalculatorAppState createState() => _MyCalculatorAppState();
}

class _MyCalculatorAppState extends State<MyCalculatorApp> {
  String result = '';
  String argument = '';
  int firstNum = 0;
  int secondNum = 0;

  void _typedText(String text) {
    if (text == 'AC') {
      setState(() {
        argument = '';
        result = '';
        firstNum = 0;
        secondNum = 0;
      });
    } else if (text == '<') {
      setState(() {
        argument = argument.substring(0, argument.length - 1);
      });
    } else if (text == '==') {
      bool flag = false;
      String num1 = '';
      String num2 = '';
      String operation = '';
      for (var i = 0; i < argument.length; i++) {
        if (i != 0 &&
            !flag &&
            (argument[i] == '+' ||
                argument[i] == '-' ||
                argument[i] == '/' ||
                argument[i] == 'X' ||
                argument[i] == '%')) {
          flag = true;
          operation = argument[i];
        } else if (flag) {
          num2 += argument[i];
        } else {
          num1 += argument[i];
        }
      }
      firstNum = int.parse(num1);
      secondNum = int.parse(num2);
      if (operation == '+') {
        setState(() {
          result = argument;
          argument = (firstNum + secondNum).toString();
        });
      } else if (operation == '/') {
        String withoutDecimal = '';
        setState(() {
          result = argument;
          argument = (firstNum / secondNum).toString();
          for (var i = 0; i < argument.length; i++) {
            if (argument[i] == '.') {
              break;
            } else {
              withoutDecimal += argument[i];
            }
          }
          argument = withoutDecimal;
        });
      } else if (operation == 'X') {
        setState(() {
          result = argument;
          argument = (firstNum * secondNum).toString();
        });
      } else if (operation == '-') {
        setState(() {
          result = argument;
          argument = (firstNum - secondNum).toString();
        });
      } else {
        setState(() {
          result = argument;
          argument = (firstNum % secondNum).toString();
        });
      }
    } else {
      setState(() {
        argument += text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        backgroundColor: const Color(0xFF28527a),
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          color: Color(0x66FFFFFF),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      argument,
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 22,
                  ),
                  CalculatorButton(
                    text: '%',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 22,
                  ),
                  CalculatorButton(
                    text: '<',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '/',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: '9',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '8',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '7',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: 'X',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: '6',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '5',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '4',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '-',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: '3',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '2',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '1',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '+',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    text: '+/-',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '0',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '00',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                  CalculatorButton(
                    text: '==',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    callback: _typedText,
                    fontSize: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
