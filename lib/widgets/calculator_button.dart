import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final Function callback;
  final double fontSize;

  CalculatorButton({
    required this.text,
    required this.textColor,
    required this.fillColor,
    required this.callback,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 70,
        width: 70,
        child: TextButton(
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: fontSize,
              ),
              color: Color(textColor),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(fillColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
