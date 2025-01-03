

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'package:meta/meta.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../../login/login_screen.dart';
import '../model/SignupModel.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  DioHelper _dioHelper= DioHelper();
  SignupModel signupModel = SignupModel();
  void signup ({required String password, required String email, required String name ,required phone})async{

    emit(SignUploading());
    try {
      final response = await _dioHelper.postData(path: ApiUrl.register, body: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "image": "null"

      });
      signupModel = SignupModel.fromJson(response.data);
      if(signupModel.status==true){
        print("**************${signupModel.status}");
        Get.offAll(LoginScreen());

        emit(SignUpsuccess());
      }
      else{
        /*Get.snackbar('','',backgroundColor: Colors.red ,colorText: Colors.red
          ,messageText:  Text(signupModel.message??"",style: TextStyle(
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
        emit(SignUpWrong());
        ApiUrl.messageup=signupModel.message??"";
      }
    }
  catch(e){
    emit(SignUperror());
  }
  }
}
