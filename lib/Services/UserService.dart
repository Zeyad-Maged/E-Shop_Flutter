import 'package:dio/dio.dart';

import '../Models/UserModel.dart';

class UserService {
  static Dio dio = Dio();

  static Future<UserModel> Register({
    required String name,
    required String email,
    required String phone,
    required String password
  }) async
  {
    try {
      Map data = {
        "Name": name,
        "Email": email,
        "Phone": phone,
        "Password": password
      };
      Response response = await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser", data: data);
      if (response.statusCode == 200) {
        return UserModel.fetchUser(response.data);
      }
      else {
        throw Exception("Error: ${response.statusCode}");
      }
    }
    catch (e) {
      throw Exception("Error: $e");
    }
  }

  static Future<UserModel> Login({
    required String email,
    required String password
  }) async
  {
    try {
      Map data = {
        "Email": email,
        "Password": password
      };
      Response response = await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser", data: data);
      if (response.statusCode == 200) {
        return UserModel.fetchUser(response.data);
      }
      else {
        throw Exception("Error: ${response.statusCode}");
      }
    }
    catch (e) {
      throw Exception("Error: $e");
    }
  }
}