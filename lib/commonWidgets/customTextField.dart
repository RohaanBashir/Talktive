import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.obscureText = false, required this.controller, required this.hintText});

  final String hintText;
  TextEditingController controller;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      controller: controller,
                      obscureText: obscureText,
                      maxLines: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      // Use the text theme
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // Remove the default underline
                        hintText: hintText,
                        // Add a hint text
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                          color: Colors.white, // Customize hint text color
                        ),

                      ),

                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
       );

  }
}
