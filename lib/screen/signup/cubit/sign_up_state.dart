part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUploading extends SignUpState {}
class SignUpsuccess extends SignUpState {}
class SignUpWrong extends SignUpState {}
class SignUperror extends SignUpState {}