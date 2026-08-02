import 'package:ecommerce_app_api_26/features/profile/cubit/image_cubit/image_cubit.dart';
import 'package:ecommerce_app_api_26/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_api_26/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app_api_26/features/categories/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app_api_26/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app_api_26/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit()..getProfile()),
        BlocProvider(create: (_) => ImageCubit()),
      ],
      child: const ProfileScreen(),
      
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
