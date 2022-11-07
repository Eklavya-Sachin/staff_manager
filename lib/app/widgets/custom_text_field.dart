import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?) validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink.shade400),
        ),
        errorStyle: TextStyle(color: Colors.pink.shade400),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink.shade400),
        ),
        isDense: true,
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
