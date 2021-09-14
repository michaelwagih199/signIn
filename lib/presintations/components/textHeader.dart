import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeaderView extends StatelessWidget {
  String text_header;
  TextAlign alignment;
  Color fontColor;
  double fontSize;

  TextHeaderView(
      this.text_header, this.alignment, this.fontColor, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Text(
      text_header,
      textAlign: alignment,
      style: GoogleFonts.comfortaa(
        textStyle: TextStyle(fontSize: fontSize, color: fontColor),
      ),
    );
  }
}
