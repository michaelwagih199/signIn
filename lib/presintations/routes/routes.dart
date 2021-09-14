import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/data/services/employes_service.dart';
import 'package:hr/presintations/screens/aboutApp/aboutApp.dart';
import 'package:hr/presintations/screens/admin/admin_location.dart';
import 'package:hr/presintations/screens/admin/cubit/admin_location_cubit.dart';
import 'package:hr/presintations/screens/home/home.dart';
import 'package:hr/presintations/screens/scan/attendance_screen.dart';
import 'package:hr/presintations/screens/signIn/cubit/login_cubit.dart';
import 'package:hr/presintations/screens/signIn/signIn.dart';
import 'package:hr/utilities/constans/strings.dart';

class AppRouter {
  EmployeesService? employeesService;

  AppRouter() {
    employeesService = EmployeesService();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                LoginCubit(employeesService: employeesService!),
            child: SignInScreen(),
          ),
        );
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case ABOUT_APP_ROUTE:
        return MaterialPageRoute(builder: (_) => AboutAppScreen());
      case ATTENDANCE_ROUTE:
        return MaterialPageRoute(builder: (_) => AttendanceScreen());
      case ADMIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => AdminLocationCubit(),
            child: AdminLocationScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
