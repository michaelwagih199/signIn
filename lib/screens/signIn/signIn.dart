import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hr/components/appBarButton.dart';
import 'package:hr/components/appTextButton.dart';
import 'package:hr/components/textField.dart';
import 'package:hr/components/textHeader.dart';
import 'package:hr/themes/appStyleConfig.dart';
import 'components/ArchSignIncustomPaint.dart';
import 'components/IconSignIn.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: 10, width: width, color: AppStyleConfig.accentColor),
            Stack(
              children: [
                Container(
                  child: CustomPaint(
                    painter: Arch(),
                    child: SizedBox(width: width, height: height * 1 / 5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: TextHeaderView('HR Application', TextAlign.center,
                        AppStyleConfig.accentColor, 30),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: height * 1 / 9),
                    child: CustomPaint(
                      painter: IconSignInCustom(),
                      child: SizedBox(width: 150, height: 150),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, height * 1 / 6, 20, 10),
              child: Column(
                children: [
                  TextFormFieldC(
                    AppStyleConfig.whiteColor,
                    22,
                    AppStyleConfig.accentColor,
                    'UserName',
                    Icon(Icons.person),
                  ),
                  SizedBox(height: 20),
                  TextFormFieldC(
                    AppStyleConfig.whiteColor,
                    22,
                    AppStyleConfig.accentColor,
                    'Password',
                    Icon(Icons.lock),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
                    child: CustomAppButton(
                        'Sign in',
                        22,
                        AppStyleConfig.whiteColor,
                        () => {
                              Navigator.of(context)
                                  .pushReplacementNamed("/home")
                            }),
                  ),
                  Container(
                    child: CustomTextButton(
                        'About App',
                        22,
                        AppStyleConfig.whiteColor,
                        () => {Navigator.of(context).pushNamed("/aboutApp")}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
