import 'package:flutter/material.dart';
import 'package:task2_flutter/constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? Function(String?) validator;

  const InputField(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.prefix,
      this.suffix,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorApp.inputField,
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(color: ColorApp.suffix),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(color: ColorApp.suffix),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  InputBorder _getBorder({Color color = ColorApp.inputField}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(40),
    );
  }
}
