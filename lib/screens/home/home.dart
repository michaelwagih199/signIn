import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr/components/appBarButton.dart';
import 'package:hr/components/textHeader.dart';
import 'package:hr/screens/signIn/components/ArchSignIncustomPaint.dart';
import 'package:hr/screens/signIn/components/IconSignIn.dart';
import 'package:hr/themes/appStyleConfig.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                      height: 10,
                      width: width,
                      color: AppStyleConfig.accentColor),
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
                          child: TextHeaderView('Home', TextAlign.center,
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: CustomAppButton('Attendance', 24,
                          AppStyleConfig.whiteColor, () => {}),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: CustomAppButton('My Attendance', 24,
                          AppStyleConfig.whiteColor, () => {}),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
