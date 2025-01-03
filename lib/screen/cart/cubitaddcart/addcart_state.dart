part of 'addcart_cubit.dart';

@immutable
abstract class AddcartState {}

class AddcartInitial extends AddcartState {}
class AddcartLoading extends AddcartState {}
class AddcartSucces extends AddcartState {}
class AddcartError extends AddcartState {}

