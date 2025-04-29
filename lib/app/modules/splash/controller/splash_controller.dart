import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() async {
    super.onInit();
    await navigatorGetStarted();
  }

  Future<void> navigatorGetStarted() async {
    await Future.delayed(
      const Duration(seconds: 5),
    ).then((value) => Get.offAllNamed('/get-started'));
  }
}