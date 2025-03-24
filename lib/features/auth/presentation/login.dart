import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talktive/commonWidgets/customTextField.dart';
import 'package:talktive/features/auth/presentation/RegisterPage.dart';
import 'package:talktive/messages.dart';

import '../../../commonWidgets/CustomButton.dart';
import '../cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthSuccess) {
            // Navigate to Messages page on successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Messages()),
            );
          }
        },
        builder: (context, state) {
          return Center(
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
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Trigger login
                        authCubit.login(
                          emailController.text.toString(),
                          passController.text.toString(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: state is AuthLoading
                          ? CircularProgressIndicator()
                          : Text("Login"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont have an account?  ",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to RegisterPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Click to register  ",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}