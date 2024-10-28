import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/const/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? icon;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onMorePressed;

  const CustomAppBar(
      {super.key,
      required this.title,
      required this.onSearchPressed,
      required this.onMorePressed,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon,
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
      title: title,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ))
      ],
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
