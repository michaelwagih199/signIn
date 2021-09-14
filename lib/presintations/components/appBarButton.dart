import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr/themes/appStyleConfig.dart';

class CustomAppButton extends StatelessWidget {

  double fontSize;
  String btnText;
  Color fontColor;
  final void Function() callback;
  
  CustomAppButton(
    this.btnText,
    this.fontSize,
    this.fontColor,
    this.callback,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      width: double.infinity,
      decoration: myBoxDecoration(),
      child: TextButton(
        child: Text(
          btnText,
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(fontSize: fontSize, color: fontColor),
          ),
        ),
        onPressed: callback,
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: AppStyleConfig.accentColor,
      borderRadius: BorderRadius.all(
          Radius.circular(50) //                 <--- border radius here
          ),
      boxShadow: [
        BoxShadow(
          color: Colors.black54.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 0.5), // changes position of shadow
        ),
      ],
    );
  }
}
