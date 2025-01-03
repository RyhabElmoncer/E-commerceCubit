part of 'detilas_cubit.dart';

@immutable
sealed class DetilasState {}

final class DetilasInitial extends DetilasState {}
final class DetilasLoading extends DetilasState {}
final class DetilasSucces extends DetilasState {}
final class DetilasError extends DetilasState {}