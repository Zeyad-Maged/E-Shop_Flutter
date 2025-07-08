import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_login_signup/Providers/ShopProvider.dart';
import 'package:shopapp_login_signup/Providers/UserProvider.dart';
import 'package:shopapp_login_signup/Screens/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => ShopProvider(),),
      ],
      child: MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}