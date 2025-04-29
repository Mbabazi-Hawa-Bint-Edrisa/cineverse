import 'package:get/get.dart';
import 'package:group_five/app/modules/mylist/controller/mylist_controller.dart';

class MylistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MylistController>(
          () => MylistController(),
    );
  }
}