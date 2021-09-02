import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr/themes/appStyleConfig.dart';

class CustomTextButton extends StatelessWidget {

  double fontSize;
  String btnText;
  Color fontColor;
  final void Function() callback;

  CustomTextButton(
    this.btnText,
    this.fontSize,
    this.fontColor,
    this.callback,
  );
  @override
  Widget build(BuildContext context) {
    return  TextButton(
        child: Text(
          btnText,
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(fontSize: fontSize, color: fontColor),
          ),
        ),
        onPressed: callback,

    );
  }


}
