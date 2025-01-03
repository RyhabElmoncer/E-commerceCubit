part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySucess extends CategoryState {}
class CategoryErrors extends CategoryState {}

