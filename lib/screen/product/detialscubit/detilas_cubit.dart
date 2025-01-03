import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/detailsproductmodel.dart';

part 'detilas_state.dart';

class DetilasCubit extends Cubit<DetilasState> {
  DetilasCubit() : super(DetilasInitial());
  DioHelper _dioHelper=DioHelper();
  Detailsproductmodel detailsproductmodel=Detailsproductmodel();
  void detilas({required int id})async{
    emit(DetilasLoading());
    try{
      DioHelper.init();
      final response = await _dioHelper
          .getData(path:'products/${id}',);
      detailsproductmodel=Detailsproductmodel.fromJson(response.data);
      if (detailsproductmodel.status == true) {
        emit(DetilasSucces());


      } else {
        emit(DetilasError());
        ApiUrl.messageup = detailsproductmodel.message ?? "";
      }
    } catch (e) {
      print(e);
      emit(DetilasError());
    }
  }
}
