import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shoe/screen/cart/model/PostCartModel.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';

part 'addcart_state.dart';

class AddcartCubit extends Cubit<AddcartState> {
  AddcartCubit() : super(AddcartInitial());
  DioHelper _dioHelper = DioHelper();
  PostCartModel postCartModel = PostCartModel();
  void addcart({required int idnumber}) async {
    emit(AddcartLoading());
    try {
      DioHelper.init();
      final response = await _dioHelper
          .postData(path: ApiUrl.cart, body: {"product_id": idnumber});
      postCartModel = PostCartModel.fromJson(response.data);
      if (postCartModel.status == true) {

        Fluttertoast.showToast(msg: '${postCartModel.message}',
          backgroundColor: Colors.pink,
          fontSize: 18,

        );
        emit(AddcartSucces());

      } else {
        emit(AddcartError());
        ApiUrl.messageup = postCartModel.message ?? "";
      }
    } catch (e) {
      emit(AddcartError());
    }
  }
}
