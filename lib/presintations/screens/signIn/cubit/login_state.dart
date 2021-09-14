part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class AdminState extends LoginState {}

class LoginEror extends LoginState {
  final String errorMessage;
  LoginEror({required this.errorMessage});
}
