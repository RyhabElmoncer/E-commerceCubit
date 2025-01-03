part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileSucces extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileErrors extends ProfileState {}
