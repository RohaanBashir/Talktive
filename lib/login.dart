import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talktive/customTextField.dart';

import 'CustomButton.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Enter email...",
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passController,
                hintText: "Enter password...",
                obscureText: true,
              ),
              SizedBox(height: 10),
              MyCustomButton(callback: () {}, text: "Login"),
              SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?  ",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "click to register  ",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.white,decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
