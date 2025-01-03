import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../dblocallog/hivo.dart';
import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/ShowCartModel.dart';

part 'getcart_state.dart';

class GetcartCubit extends Cubit<GetcartState> {
  GetcartCubit() : super(GetcartInitial());
  DioHelper _dioHelper = DioHelper();
  ShowCartModel showCartModel = ShowCartModel();

  void getcart() async {
    emit(GetcartLoading());

    try {
      DioHelper.init();

      final response = await _dioHelper.getData(
        path: ApiUrl.cart,
      );
      showCartModel = ShowCartModel.fromJson(response.data);

      print(response.data.toString());
      if (showCartModel.status == true) {

        emit(GetcartSucess());
      } else {
        emit(GetcartError());
        ApiUrl.messageup = showCartModel.message ?? "";
      }
    } catch (e) {
      print('*************cart$e');
      emit(GetcartError());
    }
  }
}
