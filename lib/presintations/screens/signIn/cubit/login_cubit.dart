import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hr/data/services/employes_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  
  CollectionReference collection =
      FirebaseFirestore.instance.collection('employees');

  final EmployeesService employeesService;

  LoginCubit({required this.employeesService}) : super(LoginInitial());

  signIn(String username, String password) {
    emit(LoginLoading());
    if (username.isEmpty || password.isEmpty) {
      emit(LoginEror(errorMessage: "PLease Fill Username and Password"));
    } else if (username == "SuperAdmin" && password == "Super@Admin123") {
      emit(AdminState());
    } else {
      collection
          .where("userName", isEqualTo: username)
          .where("password", isEqualTo: password)
          .get()
          .then((value) {
        if (value.docs.isEmpty)
          emit(LoginEror(errorMessage: "Invalid Credentials"));
        else
          emit(LoginSuccess());
      });
    }
  }

  getAllEmployees() async {}
}
