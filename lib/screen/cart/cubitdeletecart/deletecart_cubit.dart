import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shoe/screen/cart/model/deleteCartModel.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';

part 'deletecart_state.dart';

class DeletecartCubit extends Cubit<DeletecartState> {
  DeletecartCubit() : super(DeletecartInitial());
  DioHelper _dioHelper=DioHelper();
  DeleteCartModel deleteCartModel=DeleteCartModel();
  void deletecart({required int id})async{
    emit(DeletecartLoading());
    try{
      DioHelper.init();
      final response = await _dioHelper
          .deleteData(path:'carts/${id}',);
      deleteCartModel=DeleteCartModel.fromJson(response.data);
      if (deleteCartModel.status == true) {
        emit(DeletecartSucces());

        Fluttertoast.showToast(msg: '${deleteCartModel.message}',
          backgroundColor: Colors.pink,
          fontSize: 18,

        );
      } else {
        emit(DeletecartErrors());
        ApiUrl.messageup = deleteCartModel.message ?? "";
      }
    } catch (e) {
      print(e);
      emit(DeletecartErrors());
    }
  }
}
