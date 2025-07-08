import 'package:flutter/material.dart';
import 'package:shopapp_login_signup/Models/ShopModel.dart';
import 'package:shopapp_login_signup/Services/ShopService.dart';

class ShopProvider extends ChangeNotifier
{
  ShopModel? model;
  Future<void> getProducts()
  async
  {
    model = await ShopService.getProducts();
    notifyListeners();
  }
}