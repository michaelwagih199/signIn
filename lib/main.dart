
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr/routes.dart';
import 'package:hr/themes/style.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new HrApp());
    });
}

class HrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          initialRoute: '/',
          routes: routes,
        ),
      ),
    );
  }
}
