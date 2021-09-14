import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldC extends StatelessWidget {
  double fontSize;
  String hintText;
  Color fontColor;
  Color backgroundColor;
  Icon icon;
  TextEditingController controller;
  bool obscureText;

  TextFormFieldC({
    required this.obscureText,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontColor,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: TextField(
          obscureText: obscureText,
          autofocus: false,
          controller: controller,
          style: GoogleFonts.comfortaa(
              textStyle: TextStyle(fontSize: fontSize, color: fontColor)),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 5), // add padding to adjust icon
              child: icon,
            ),
            filled: true,
            fillColor: backgroundColor,
            hintText: this.hintText,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: backgroundColor),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: backgroundColor),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),
      ),
    );
  }
}
