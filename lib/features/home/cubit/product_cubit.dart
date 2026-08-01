import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';
import 'package:ecommerce_app_api_26/features/home/data/products_api/products_api.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  Future<void> getAllProducts() async {
    emit(ProductLoading());
    try {
      List<ProductModel> products = await ProductsApi().getAllProducts();
      emit(ProductSuccess(products));
      
    } catch (e) {
      emit(ProductError(e.toString()));
     
    }
  }
}
