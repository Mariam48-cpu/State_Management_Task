import 'package:ecommerce_app_api_26/features/categories/cubit_category/category_cubit.dart';
import 'package:ecommerce_app_api_26/features/categories/cubit_category/category_state.dart';
import 'package:ecommerce_app_api_26/features/categories/presentation/screens/category_products.dart';
import 'package:ecommerce_app_api_26/features/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllProducts(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<CategoryCubit, categorieState>(
          builder: (context, state) {
            if (state is categoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is categorieError) {
              return Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              );
            } else if (state is categorieSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              CategoryProducts(id: category.id ?? 1),
                        ),
                      );
                    },
                    child: CategoryCard(
                      id: category.id,
                      name: category.name,
                      imageUrl: category.image,
                    ),
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

/// item 1
/// id=1
/// name
/// image
///
///
/// item 2
/// id=2
/// name
/// image
