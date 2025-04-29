import 'package:get/get.dart';
import 'package:group_five/app/modules/search/controller/search_page_controller.dart';

class SearchPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchPageController>(
          () => SearchPageController(),
    );
  }
}