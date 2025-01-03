part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}
class BannerSuccess extends BannerState {}
class BannerLoading extends BannerState {}
class BannerErrors extends BannerState {}
