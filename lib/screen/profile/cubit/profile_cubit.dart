import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../dblocallog/hivo.dart';
import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/ProfileModel.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  DioHelper _dioHelper = DioHelper();
  ProfileModel profileModel = ProfileModel();

  void profile() async {
    emit(ProfileLoading());
    try {
      DioHelper.init();
      final response = await _dioHelper.getData(path: ApiUrl.profile);
        profileModel = ProfileModel.fromJson(response.data);
        if(profileModel.status==true){
          emit(ProfileSucces());
        }
        else{
          emit(ProfileErrors());
        }

    } catch (e) {
      emit(ProfileErrors());
    }
  }
}
