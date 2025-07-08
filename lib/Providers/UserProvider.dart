import 'package:flutter/material.dart';
import 'package:shopapp_login_signup/Models/UserModel.dart';
import 'package:shopapp_login_signup/Services/UserService.dart';

class UserProvider extends ChangeNotifier
{
  UserModel? model;
  Future<void> Register(
      {
        required String name,
        required String email,
        required String phone,
        required String password
      })
  async
  {
    model = await UserService.Register(name: name, email: email, phone: phone, password: password);
    notifyListeners();
  }

  Future<void> Login({
    required String email,
    required String password
})
  async
  {
    model = await UserService.Login(email: email, password: password);
    notifyListeners();
  }
}