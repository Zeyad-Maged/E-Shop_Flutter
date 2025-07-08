class ShopModel
{
  List<dynamic> response;
  ShopModel({required this.response});
  
  factory ShopModel.fetchProducts(Map<String, dynamic> json)
  {
    return ShopModel(response: json["response"]);
  }
}