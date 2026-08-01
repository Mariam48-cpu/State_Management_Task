import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/categories/cubit_category/category_state.dart';
import 'package:ecommerce_app_api_26/features/categories/data/categories_api/categories_api.dart';
import 'package:ecommerce_app_api_26/features/categories/data/models/category_model.dart';

class CategoryCubit extends Cubit<categorieState> {
  CategoryCubit() : super(categorieInitial());
  Future<void> getAllProducts() async {
    emit(categoryLoading());
    try {
      List<CategoryModel> products = await CategoriesApi().getAllCategories();
      emit(categorieSuccess(products));
    } catch (e) {
      emit(categorieError(e.toString()));
    }
  }
}
