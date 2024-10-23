import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';

class BaseButtonApp extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BaseButtonApp(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
    ),
        child: Text(
          title,
           style: kFontSubTitle(fontSize: 20, color: AppColors.lightBackground),
        ),);
  }
}
