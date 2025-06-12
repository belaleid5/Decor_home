import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    theme: ThemeData(
      appBarTheme:  AppBarTheme(

        actionsIconTheme: IconThemeData(
          color: AppColor.iconColor, // Change to your desired color
        ),
        elevation: 0.0,
        color: Colors.white,
        foregroundColor: Colors.white,
   // Change to your desired color
      ),
           scaffoldBackgroundColor: Colors.white, // Change to your desired color
    ),
      debugShowCheckedModeBanner: false,
      title: 'Decor App',
      onGenerateRoute: AppRouter.onGenerate,
      initialRoute: AppRouter.splashRoute,
    );
  }
}



