import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    theme: ThemeData(
      appBarTheme:  AppBarTheme(
        iconTheme: const IconThemeData(color: AppColor.iconColor),
        elevation: 0.0,
        color: Colors.white,
        foregroundColor: Colors.white,
      ),
           scaffoldBackgroundColor: Colors.white, 
    ),
      debugShowCheckedModeBanner: false,
      title: 'Decor App',
      onGenerateRoute: AppRouter.onGenerate,
      initialRoute: AppRouter.splashRoute,
    );
  }
}



