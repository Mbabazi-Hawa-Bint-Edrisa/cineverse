import 'package:get/get.dart';

class RegisterController extends GetxController{
  var obscure = true.obs;
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;

  void postUser() async{
    try {
      Get.toNamed('/login');
    } catch (e) {
      throw Exception(e);
    }
  }
}