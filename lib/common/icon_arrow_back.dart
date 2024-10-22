import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconArrowBack extends StatelessWidget {
  const IconArrowBack({super.key});

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Container(
            height: media.height * 0.08,
            width: media.width * 0.08,
            decoration: BoxDecoration(
                color: context.isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
                shape: BoxShape.circle
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              // color: context.isDarkMode ? Colors.black : Colors.white,
            )));
  }
}
