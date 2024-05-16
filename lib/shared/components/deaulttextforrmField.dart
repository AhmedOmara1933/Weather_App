import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  final TextEditingController ?controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final String? Function(String?)? validate;
  final String text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  void Function()? suffixOnPressed;
  bool obscureText;

  DefaultTextFormField(
      {super.key,
        this.controller,
        this.onFieldSubmitted,
        this.obscureText = false,
        this.validate,
        this.onChanged,
        required this.keyboardType,
        required this.text,
        this.prefixIcon,
        this.suffixIcon,
        this.suffixOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validate,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixOnPressed,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
