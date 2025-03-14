import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomButton.dart';
import 'customTextField.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Enter name...",
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passController,
                hintText: "Enter email...",
                obscureText: true,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passController,
                hintText: "Enter password...",
                obscureText: true,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passController,
                hintText: "Confirm password...",
                obscureText: true,
              ),
              SizedBox(height: 10),
              MyCustomButton(callback: () {}, text: "Register"),
              SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Got an account?  ",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "click to login  ",
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
