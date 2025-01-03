import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';


import '../../dblocallog/hivo.dart';
import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../../nhome/nhomescreen.dart';
import '../../profile/model/ProfileModel.dart';
import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  DioHelper _dioHelper=DioHelper();
  LoginModel loginModel=LoginModel();
  ProfileModel profileModel=ProfileModel();

  void login({ required String mail, required String password,})async{
    emit(LoginLoading());
    try {
      final response = await _dioHelper.postData(path: ApiUrl.login, body: {
        "email": mail,
        "password": password,
      });
      loginModel=LoginModel.fromJson(response.data);
      if(loginModel.status==true){
        StoragedataLogin.addtoken(loginModel.data?.token??"");


       DioHelper.headers['Authorization']=loginModel.data?.token??""; String token =StoragedataLogin.gettoken();
        DioHelper.headers['Authorization']=token;
        final response2 = await _dioHelper.getData(path: ApiUrl.profile);
        print(response.data.toString());
        profileModel=ProfileModel.fromJson(response.data);
        print(profileModel.data?.phone);

        Get.offAll(NhomeScreen());
        emit(LoginSucess());
      }
      else{
        /*Get.snackbar('','',backgroundColor: Colors.red ,colorText: Colors.red
          ,messageText:  Text(loginModel.message??"",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
            //textAlign: TextAlign.center,
          ),
         titleText: Text('⚠️Wrong',style: TextStyle(
           color: Colors.black,
           fontSize: 16,
         ),
           //textAlign: TextAlign.center,
         ),

        );*/
        emit(LoginWrong());
        ApiUrl.message=loginModel.message??"";

      }

    }
    catch(e){

      emit(LoginErorr());
    }
  }
}
