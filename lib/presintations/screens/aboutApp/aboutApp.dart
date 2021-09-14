import 'package:flutter/material.dart';
import 'package:hr/presintations/components/textHeader.dart';
import 'package:hr/presintations/screens/signIn/components/ArchSignIncustomPaint.dart';
import 'package:hr/themes/appStyleConfig.dart';

class AboutAppScreen extends StatefulWidget {
  AboutAppScreen({Key? key}) : super(key: key);
  @override
  AboutAppScreenState createState() => AboutAppScreenState();
}

class AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
        backgroundColor: AppStyleConfig.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
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
                        child: TextHeaderView('About Application',
                            TextAlign.center, AppStyleConfig.accentColor, 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: myBoxDecoration(),
              margin: EdgeInsets.fromLTRB(
                  width * 1 / 14, width * 1 / 8, width * 1 / 14, width * 1 / 8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: AppStyleConfig.accentColor,
                      width: double.infinity,
                      child: Center(
                        child: TextHeaderView('Sign In Application',
                            TextAlign.center, AppStyleConfig.whiteColor, 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Image.asset(
                        'assets/images/logo_polimigo.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextHeaderView(
                              'Attendance with Code And Location',
                              TextAlign.center,
                              AppStyleConfig.primaryColor,
                              20),
                          TextHeaderView('Power By Polimigo Company',
                              TextAlign.center, AppStyleConfig.accentColor, 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: AppStyleConfig.whiteColor,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    );
  }
}
