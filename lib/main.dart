import 'package:ecommerce_app_api_26/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_api_26/core/theme/app_theme.dart';

import 'features/main_wrapper/presentation/screens/main_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      // home: const MainWrapper(),
      home: const LoginScreen(),
    );
  }
}
