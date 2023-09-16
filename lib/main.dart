import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/res/app_color.dart';
import 'package:weather_app/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mausam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.defaultAppColor,
          brightness: Brightness.dark
        ),
        useMaterial3: true,
        fontFamily: 'Lato',
      ),
      home: const HomeScreen(),
    );
  }
}
