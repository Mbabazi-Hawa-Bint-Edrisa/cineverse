import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:group_five/app/modules/splash/controller/splash_controller.dart';

class SplashView extends GetView<SplashController>{
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.navigatorGetStarted();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/splash/data.json"),
      ),
    );
  }
}
