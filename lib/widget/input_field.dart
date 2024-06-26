import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });
  var controller = TextEditingController();
  var hintText;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  bool? obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Agbalumo'
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText!,
      ),
    );
  }
}