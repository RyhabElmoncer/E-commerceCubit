import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../diohelper/diohelper.dart';
import '../../diohelper/urlapi.dart';
import '../model/CategoryModel.dart';


part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  DioHelper _dioHelper= DioHelper();
  CategoryModel categoryModel = CategoryModel();
  void getcategory ()async{
    emit(CategoryLoading());
    try {
      final response = await _dioHelper.getData(path: ApiUrl.category,);
     categoryModel = CategoryModel.fromJson(response.data);

      if(categoryModel.status==true){
        emit(CategorySucess());

      }
      else{
        emit(CategoryErrors());
        ApiUrl.messageup=categoryModel.message??"";
      }
    }
    catch(e){
      print('*************$e');
      emit(CategoryErrors());
    }
  }
}
