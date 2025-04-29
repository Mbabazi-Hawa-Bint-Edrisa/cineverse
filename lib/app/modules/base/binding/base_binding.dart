import 'package:get/get.dart';
import 'package:group_five/app/modules/base/controller/base_controller.dart';

class BaseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
          () => BaseController(),
    );
  }
}