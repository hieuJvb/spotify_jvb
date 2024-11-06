import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/configs/assets/app_vector.dart';

class ForwardWidget extends StatelessWidget {

  final VoidCallback onPressed;
  const ForwardWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: context.isDarkMode
          ? SvgPicture.asset(AppVectors.forwardDark)
          : SvgPicture.asset(AppVectors.forwardLight),
    );
  }
}
