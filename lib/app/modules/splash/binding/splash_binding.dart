import 'package:get/get.dart';
import 'package:group_five/app/modules/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
  }
}