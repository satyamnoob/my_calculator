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
      margin: const EdgeInsets.all(7),
      child: SizedBox(
        height: 75,
        width: 75,
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
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
