import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/home/binding/home_binding.dart';
import 'package:group_five/app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CineVerse',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
    );
  }
}

