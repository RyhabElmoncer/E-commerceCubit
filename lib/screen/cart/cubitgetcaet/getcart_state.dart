part of 'getcart_cubit.dart';

@immutable
abstract class GetcartState {}

class GetcartInitial extends GetcartState {}
class GetcartSucess extends GetcartState {}
class GetcartLoading extends GetcartState {}
class GetcartError extends GetcartState {}


