import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_login_signup/Providers/UserProvider.dart';
import 'package:shopapp_login_signup/Widgets/text_field.dart';

import 'Home.dart';
import 'SignUp.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: NetworkImage(
                      "https://media.istockphoto.com/id/1196083861/vector/simple-man-head-icon-set.jpg?s=612x612&w=0&k=20&c=a8fwdX6UKUVCOedN_p0pPszu8B4f6sjarDmUGHngvdM="),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              text_field(
                  controller: emailController,
                  labelText: "Email",
                  icon: Icons.email,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              text_field(
                  controller: passwordController,
                  labelText: "Password",
                  icon: Icons.password,
                obscureText: true,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 5,
              ),
              Consumer<UserProvider>(builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () async
                    {
                      if(formKey.currentState!.validate())
                      {
                        await value.Login(email: emailController.text, password: passwordController.text);
                        if(value.model?.status == true)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value.model?.message}")));
                      }
                    },
                    child: Text("Login"),
                );

              },),

              Row(
                children: [
                  Text("Don't Have an Acoount? "),
                  TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      },
                      child: Text("Sign Up")
                  ),
                ],
              )
              ],
          ),
        ),
      ),
    );
  }
}
