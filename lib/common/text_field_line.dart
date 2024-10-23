import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:flutter/material.dart';
import '../utils/const/fonts.dart';

class TextFieldLine extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final String? errorText;


  const TextFieldLine(
      {super.key, required this.controller, required this.hintText, this.isPasswordField = false, this.validator,  this.errorText});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kFontParagraph(fontSize: 16, color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.2)
              )
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: media.height * 0.03,
              horizontal: media.width * 0.05
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.5)),
        ),

      ),
      // obscureText: isPasswordField ? ! state.isPasswordVisible : false,
      controller: controller,
      validator: validator,
    );
  }
}
