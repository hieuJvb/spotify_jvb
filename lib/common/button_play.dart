import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/configs/assets/app_vector.dart';
class ButtonPlay extends StatefulWidget {
  const ButtonPlay({super.key});

  @override
  State<ButtonPlay> createState() => _ButtonPlayState();
}

class _ButtonPlayState extends State<ButtonPlay> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffE6E6E6),
      radius: 15, // Kích thước của CircleAvatar
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          AppVectors.iconPlay,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
