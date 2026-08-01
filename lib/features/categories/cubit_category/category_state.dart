
import 'package:ecommerce_app_api_26/features/categories/data/models/category_model.dart';

abstract class categorieState {}

final class categorieInitial extends categorieState {}
final class categorieError extends categorieState {
  final String errorMessage;
  categorieError(this.errorMessage);
}
final class categoryLoading extends categorieState {}
final class categorieSuccess extends categorieState {
  final List<CategoryModel> categories;
  categorieSuccess(this.categories);
}
