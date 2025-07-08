import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_login_signup/Providers/ShopProvider.dart';
import 'package:shopapp_login_signup/Services/ShopService.dart';

import 'ShopDetails.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("E-Shop"),
      ),
      body: Consumer<ShopProvider>(
        builder: (context, value, child) {
          var data = value.model?.response;
          if (value.model == null) {
            value.getProducts();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopDetails(data: data?[index]),
                        ));
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.network("${data?[index]["imageUrl"]}", fit: BoxFit.cover,)
                      ),
                      Text("${data?[index]["name"]}"),
                      Text("${data?[index]["price"]}\$")
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
