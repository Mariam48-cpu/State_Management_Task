import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';

abstract class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}
final class CategoryProductsError extends CategoryProductsState {
  final String errorMessage;
  CategoryProductsError(this.errorMessage);
}
final class CategoryProductsLoading extends CategoryProductsState {}
final class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductModel>  CategoryProducts;
 CategoryProductsSuccess(this. CategoryProducts);
}