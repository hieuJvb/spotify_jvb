import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/fonts.dart';

class WidgetTab extends StatefulWidget {
  const WidgetTab({super.key});

  @override
  State<WidgetTab> createState() => _WidgetTabState();
}

class _WidgetTabState extends State<WidgetTab> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

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
