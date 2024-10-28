import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/fonts.dart';

class WidgetTab extends StatelessWidget {
  const WidgetTab({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      labelColor: context.isDarkMode ? AppColors.white : AppColors.black,
      unselectedLabelColor: AppColors.grey.withOpacity(0.3),
      indicatorColor: AppColors.primary,
      isScrollable: true,
      tabs: [
        Text("News", style: kFontTitle(fontSize: 20)),
        Text("Video", style: kFontTitle(fontSize: 20)),
        Text("Artists", style: kFontTitle(fontSize: 20)),
        Text("Podcast", style: kFontTitle(fontSize: 20)),

      ],
    );
  }
}
