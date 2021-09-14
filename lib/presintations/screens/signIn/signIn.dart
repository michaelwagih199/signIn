import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/presintations/components/appBarButton.dart';
import 'package:hr/presintations/components/appTextButton.dart';
import 'package:hr/presintations/components/textField.dart';
import 'package:hr/presintations/components/textHeader.dart';
import 'package:hr/presintations/screens/signIn/cubit/login_cubit.dart';
import 'package:hr/themes/appStyleConfig.dart';
import 'package:hr/utilities/constans/strings.dart';
import 'package:toast/toast.dart';
import 'components/ArchSignIncustomPaint.dart';
import 'components/IconSignIn.dart';

class SignInScreen extends StatelessWidget {

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In App"),
        backgroundColor: AppStyleConfig.primaryColor,
      ),
      body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushNamed(HOME_ROUTE);
            } else if (state is LoginEror) {
              Toast.show(
                state.errorMessage,
                context,
                duration: 3,
                backgroundColor: AppStyleConfig.warning,
                gravity: Toast.BOTTOM,
              );
            }else if (state is AdminState){
              Navigator.of(context).pushNamed(ADMIN_ROUTE);
            }
            
          },
          child: ListView(
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
                      backgroundColor: AppStyleConfig.whiteColor,
                      fontSize: 22,
                      fontColor: AppStyleConfig.accentColor,
                      hintText: 'UserName',
                      icon: Icon(Icons.person),
                      controller: _userController,
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    TextFormFieldC(
                      backgroundColor: AppStyleConfig.whiteColor,
                      fontSize: 22,
                      fontColor: AppStyleConfig.accentColor,
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
                      child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading)
                            return CircularProgressIndicator();
                          return CustomAppButton(
                              'Sign in', 22, AppStyleConfig.whiteColor, () {
                            BlocProvider.of<LoginCubit>(context).signIn(
                                _userController.text, _passwordController.text);
                          });
                        },
                      ),
                    ),
                    Container(
                      child: CustomTextButton(
                          'About App', 22, AppStyleConfig.whiteColor, () {
                        Navigator.of(context).pushNamed(ABOUT_APP_ROUTE);
                      }),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
