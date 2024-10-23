import 'package:flutter/material.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/fonts.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;


    return  Container(
      height: media.height * 0.13,
      width: media.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: media.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('New Album',
                style: kFontSubTitle(
                    fontSize: 10,
                    color: AppColors.lightBackground)),
            Text('Happier Than\nEver',
                style: kFontTitle(
                    fontSize: 19,
                    color: AppColors.lightBackground)),
            Text('Billie Eilish',
                style: kFontSubTitle(
                    fontSize: 13,
                    color: AppColors.lightBackground)),
          ],
        ),
      ),
    );
  }
}
