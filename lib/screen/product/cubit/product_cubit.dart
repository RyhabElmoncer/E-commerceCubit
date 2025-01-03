import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoe/screen/Categories/cubit/category_cubit.dart';
import 'package:shoe/screen/product/model/Productmodel.dart';

import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  DioHelper _dioHelper = DioHelper();
  Productmodel productmodel = Productmodel();

  void getproduct() async {
    emit(ProductLoading());
    try {
      DioHelper.init();
      final response = await _dioHelper.getData(
        path: ApiUrl.product,
      );
      print(ApiUrl.product);
      productmodel = Productmodel.fromJson(response.data);
      if (productmodel.status == true) {

        emit(ProductSuccess());
      } else {
        emit(ProductError());
        ApiUrl.messageup = productmodel.message ?? "";
      }
    } catch (e) {
      print('*************product$e');
      emit(ProductError());
    }
  }
}
