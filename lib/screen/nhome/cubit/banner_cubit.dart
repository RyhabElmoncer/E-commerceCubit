import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/BannnerModel.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  DioHelper _dioHelper= DioHelper();
  BannerModel bannerModel = BannerModel();
  void getbanners ()async{

    emit(BannerLoading());
    try {
      final response = await _dioHelper.getData(path: ApiUrl.banners,);
      bannerModel = BannerModel.fromJson(response.data);
      if(bannerModel.status==true){
        emit(BannerSuccess());
      }
     else{
        emit(BannerErrors());
        ApiUrl.messageup=bannerModel.message??"";
      }
    }
    catch(e){
      emit(BannerErrors());
    }
  }
}
