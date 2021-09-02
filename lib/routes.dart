import 'package:flutter/widgets.dart';
import 'package:hr/screens/aboutApp/aboutApp.dart';
import 'package:hr/screens/home/home.dart';
import 'package:hr/screens/scan/test.dart';
import 'package:hr/screens/signIn/signIn.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeTestPage(),
  "/home": (BuildContext context) => HomeScreen(),
  "/aboutApp": (BuildContext context) => AboutAppScreen(),
};
