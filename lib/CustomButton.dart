import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  MyCustomButton({super.key, required this.callback, required this.text, this.width=double.infinity});

  final VoidCallback callback;
  final String text;
  var width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(text),
      ),
    );
  }
}
