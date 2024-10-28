import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:flutter/material.dart';
import '../utils/const/fonts.dart';

class TextFieldLine extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final String? errorText; // Lưu trữ thông báo lỗi nếu có
  final VoidCallback? toggleVisibility;
  final bool isVisible;




  // final bool isVisible; // Thêm biến để kiểm soát hiển thị mật khẩu
  // final VoidCallback? toggleVisibility; // Callback để ẩn/hiện mật khẩu


  const TextFieldLine({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
    this.errorText,
    this.toggleVisibility,
    this.isVisible = false,

    // this.isVisible = false,
    // this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return TextFormField(
      controller: controller,
      obscureText: isPasswordField && !isVisible, // Ẩn mật khẩu nếu cần
      validator: validator, // Sử dụng hàm validator để xác thực
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kFontParagraph(fontSize: 16, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.5)),
        ),
        errorText: errorText, // Hiển thị thông báo lỗi nếu có
        contentPadding: EdgeInsets.symmetric(
          vertical: media.height * 0.03,
          horizontal: media.width * 0.05,
        ),
        suffixIcon: isPasswordField
            ? IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: toggleVisibility, // Gọi callback khi nhấn vào
        )
            : null,
      ),
    );
  }
}
