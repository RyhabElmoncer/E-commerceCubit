import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shoe/screen/cart/model/UpdateCartModel.dart';
import 'package:shoe/screen/diohelper/diohelper.dart';

import '../../diohelper/urlapi.dart';

part 'updatecart_state.dart';

class UpdatecartCubit extends Cubit<UpdatecartState> {
  UpdatecartCubit() : super(UpdatecartInitial());
  DioHelper _dioHelper=DioHelper();
  UpdateCartModel updateCartModel=UpdateCartModel();
  void updatecart({required num quantity,required int id})async{
    emit(UpdatecartLoading());
    try{
      DioHelper.init();
      final response = await _dioHelper
          .putData(path:'carts/${id}', body: {"quantity": quantity});
      updateCartModel=UpdateCartModel.fromJson(response.data);
      if (updateCartModel.status == true) {
        emit(UpdatecartSucess());
        Fluttertoast.showToast(msg: '${updateCartModel.message}',
          backgroundColor: Colors.pink,
          fontSize: 18,

        );
      } else {
        emit(UpdatecartError());
        ApiUrl.messageup = updateCartModel.message ?? "";
      }
    } catch (e) {
      print(e);
      emit(UpdatecartError());
    }
  }
}
