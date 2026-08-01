import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/categories/cubit_category_products/category_products_state.dart';
import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';
import 'package:ecommerce_app_api_26/features/home/data/products_api/products_api.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());
  Future<void> getAllCategoryProducts(int categoryId) async {
    emit(CategoryProductsLoading());
    try {
      List<ProductModel> products = await ProductsApi().getProductsByCategory(categoryId);
      emit(CategoryProductsSuccess(products));
    } catch (e) {
      emit(CategoryProductsError(e.toString()));
    }
  }
}
