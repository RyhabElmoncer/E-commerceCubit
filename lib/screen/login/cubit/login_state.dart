part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSucess extends LoginState {}
class LoginWrong extends LoginState {}
class LoginErorr extends LoginState {}
