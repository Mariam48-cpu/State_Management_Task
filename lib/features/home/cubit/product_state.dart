part of 'product_cubit.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductError extends ProductState {
  final String errorMessage;
  ProductError(this.errorMessage);
}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess(this.products);
}