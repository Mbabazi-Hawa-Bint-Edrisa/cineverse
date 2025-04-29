import 'package:get/get.dart';
import 'package:group_five/app/modules/detail/controller/detail_controller.dart';

class DetailBinding extends Bindings{
@override
void dependencies() {
  Get.lazyPut<DetailController>(
        () => DetailController(),
  );
}
}