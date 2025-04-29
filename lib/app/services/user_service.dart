import 'package:dio/dio.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/user.dart';

class UserService{
  static Future<User> getUser(String enteredEmail, String enteredPassword) async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.baseServerUrl}/users?email=$enteredEmail&password=$enteredPassword');

    return User(
      username: response.data[0]["username"],
      email: response.data[0]["email"],
      password: response.data[0]["password"],
      privacy: response.data[0]["privacy"],
      id: response.data[0]["id"]
    );
  }

  static Future<void> postUser(String enteredUsername, String enteredEmail, String enteredPassword) async {
    final dio = Dio();
    // ignore: unused_local_variable
    final response = await dio.post(
        '${AppConstants.baseServerUrl}/users',
      data: {
          'username': enteredUsername,
          'email': enteredEmail,
          'password': enteredPassword,
          'privacy': true
      }
    );
  }

  login(String value, String value2) {}
}