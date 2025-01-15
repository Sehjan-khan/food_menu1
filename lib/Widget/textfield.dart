import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color fillColor;
  final Color hintTextColor;
  final double borderRadius;
  bool obscure;

   CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.fillColor = const Color(0xffE9E9E9),
    this.hintTextColor = const Color(0xff5F5F5F),
    this.borderRadius = 15.0,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
obscureText: obscure,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
        ),
        fillColor: fillColor,
        filled: true,
      ),
    );
  }
}
