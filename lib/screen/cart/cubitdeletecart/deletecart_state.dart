part of 'deletecart_cubit.dart';

@immutable
abstract class DeletecartState {}

class DeletecartInitial extends DeletecartState {}
class DeletecartSucces extends DeletecartState {}
class DeletecartLoading extends DeletecartState {}
class DeletecartErrors extends DeletecartState {}