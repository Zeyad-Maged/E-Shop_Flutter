import 'package:dio/dio.dart';
import 'package:shopapp_login_signup/Models/ShopModel.dart';

class ShopService
{
  static Dio dio = Dio();
  static Future<ShopModel> getProducts()
  async
  {
    Response response = await dio.get("https://elsewedyteam.runasp.net/api/Product/GetProducts");
    return ShopModel.fetchProducts(response.data);
  }
}