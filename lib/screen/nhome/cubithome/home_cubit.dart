import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoe/screen/diohelper/urlapi.dart';

import '../../diohelper/diohelper.dart';
import '../model/HomeModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  DioHelper _dioHelper=DioHelper();
  HomeModel homeModel=HomeModel();
  void home()async{
    emit(HomeLoading());
    try {
      final response = await _dioHelper.getData(path: ApiUrl.home);
      homeModel = HomeModel.fromJson(response.data);
      if(homeModel.status==true){
        emit(HomeSucess());
      }
      else{
        emit(HomeError());
      }
    }catch(e){
      emit(HomeError());

    }
  }
}
