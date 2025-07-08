import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp_login_signup/Providers/UserProvider.dart';
import 'package:shopapp_login_signup/Screens/Login.dart';

import '../Widgets/text_field.dart';

class SignUp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              text_field(
                controller: nameController,
                labelText: "Name",
                icon: Icons.person,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              text_field(
                controller: phoneController,
                labelText: "Phone",
                icon: Icons.phone,
                type: TextInputType.phone,
              ),
              const SizedBox(
                height: 10,
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
                      await value.Register(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text);
                      if(value.model?.status == true)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value.model?.message}")));
                    }
                  },
                  child: Text("Sign Up"),
                );

              },),

              Row(
                children: [
                  Text("Already Have an Acoount? "),
                  TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      },
                      child: Text("Login")
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
