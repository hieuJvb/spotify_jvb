import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
    static ThemeData lightTheme = ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.lightBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            textStyle: GoogleFonts.robotoSlab(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          )
        ),
      brightness: Brightness.light
    );


    static ThemeData darkTheme = ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.darkBackground,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: GoogleFonts.robotoSlab(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
            )
        ),
        brightness: Brightness.dark
    );
}