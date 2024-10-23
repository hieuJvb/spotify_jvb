import 'package:flutter/cupertino.dart';
import "package:google_fonts/google_fonts.dart";

TextStyle kFontTitle({required double fontSize, Color? color}) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w800
  );
}

TextStyle kFontSubTitle({required double fontSize, required Color color}) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600
  );
}

TextStyle kFontParagraph({required double fontSize, required Color color}) {
  return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400
  );
}


// TextStyle kFontSubtitle({required double fontSize, required Color color}) {
//   return GoogleFonts.roboto(
//       color: color,
//       fontSize: fontSize,
//       fontWeight: FontWeight.w400
//   );
// }