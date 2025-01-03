part of 'updatecart_cubit.dart';

@immutable
abstract class UpdatecartState {}

class UpdatecartInitial extends UpdatecartState {}
class UpdatecartLoading extends UpdatecartState {}
class UpdatecartSucess extends UpdatecartState {}
class UpdatecartError extends UpdatecartState {}
