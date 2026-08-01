import 'package:ecommerce_app_api_26/features/categories/cubit_category_products/category_products_cubit.dart';
import 'package:ecommerce_app_api_26/features/categories/cubit_category_products/category_products_state.dart';
import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/product_card.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit()..getAllCategoryProducts(id),
      child: Scaffold(
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            if (state is CategoryProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryProductsError) {
              return Center(
                child: Text(
                  'Error',
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              );
            } else if (state is CategoryProductsSuccess) {
              List<ProductModel> CategoryProducts = state.CategoryProducts;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: CategoryProducts.length,
                    itemBuilder: (context, index) {
                      final product = CategoryProducts[index];
                      return ProductCard(
                        title: product.title,
                        price: product.price,
                        description: product.description,
                        image: product.images![0],
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
