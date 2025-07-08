import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const ShopDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${data["name"]}"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network("${data["imageUrl"]}", width: 350, height: 350,),
            Text("${data["name"]}"),
            Text("${data["price"]}\$"),
            Text("${data["description"]}"),
          ],
        ),
      ),
    );
  }
}
