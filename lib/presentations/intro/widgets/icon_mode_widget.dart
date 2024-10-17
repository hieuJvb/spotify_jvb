import 'dart:ui';

import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class IconModeWidget extends StatelessWidget {

  final String urlVector;
  final String title;

  const IconModeWidget({super.key, required this.urlVector, required this.title});


  @override
  Widget build(BuildContext context) {
    
    final media = MediaQuery.sizeOf(context);
    
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: media.width * 0.18,
              width: media.width * 0.18,
              child: SvgPicture.asset(
                urlVector,
                fit: BoxFit.none,
              ),
              decoration: BoxDecoration(
                  color: Color(0xff30393C).withOpacity(0.5),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        SizedBox(height: media.height * 0.02,),
        Text(title, style: kFontSubTitle(fontSize: 17, color: AppColors.lightBackground),)
      ],
    );
  }
}
