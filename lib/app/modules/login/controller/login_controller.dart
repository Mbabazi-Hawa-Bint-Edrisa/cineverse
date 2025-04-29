import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_five/app/routes/app_pages.dart';

import 'package:group_five/app/services/user_service.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final username = ''.obs;
  final userId = 0.obs;
  final obscure = true.obs;

  final UserService _userService = UserService();

  Future<void> getUser() async {
    try {
      final user = await _userService.login(email.value, password.value);
      username.value = user.email; 
      userId.value = int.parse(user.id); 
      Get.offNamed(Routes.base); 
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e', backgroundColor: Colors.red);
    }
  }
}
// import 'package:get/get.dart';
// import 'package:group_five/app/models/user.dart';
// import 'package:group_five/app/services/user_service.dart';

// class LoginController extends GetxController{
//   var obscure = true.obs;
//   var user = User().obs;
//   var email = "".obs;
//   var username = "".obs;
//   var userId = 1.obs;
//   var password = "".obs;

//   void getUser() async{
//     try {
//       var result = await UserService.getUser(email.value,password.value);
//       user.value = result;
//       username.value = user.value.username!;
//       userId.value = user.value.id!;
//       if(user.value.username != ""){
//         Get.toNamed('/base');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }