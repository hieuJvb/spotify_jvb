import 'package:expenses_tracker/common/custom_app_bar.dart';
import 'package:expenses_tracker/presentations/home/widgets/card_header.dart';
import 'package:expenses_tracker/presentations/home/widgets/play_list_item.dart';
import 'package:expenses_tracker/presentations/home/widgets/widget_tab.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../widgets/news_song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Tạo Ticker (tabcontroller) để chuyển giữa các tab
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
    final media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            title: SvgPicture.asset(
              AppVectors.logo,
              fit: BoxFit.contain,
              height: media.height * 0.04,
            ),
            onSearchPressed: () {},
            onMorePressed: () {},
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: media.height * 0.03,
              left: media.width * 0.06,
              right: media.width * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card Header
                const CardHeader(),

                SizedBox(height: media.height * 0.04),

                //chuyển tab từ news -> video -> artists -> podcast
                WidgetTab(
                  tabController: tabController,
                ),

                SizedBox(height: media.height * 0.02),

                SizedBox(
                  height: media.height * 0.3,
                  child: TabBarView(controller: tabController, children: [
                    NewsSong(tabController: tabController),
                    Container(),
                    Container(),
                    Container()
                  ]),
                ),

                //News Item

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Playlist",
                        style: kFontTitle(
                            fontSize: 20,
                            color: context.isDarkMode
                                ? AppColors.white
                                : AppColors.black)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style:
                            kFontSubTitle(fontSize: 12, color: AppColors.grey),
                      ),
                    ),
                  ],
                ),

                //playlist
                Expanded(child: PlayListItem()),
              ],
            ),
          ),
        ),
        Positioned(
          top: -27,
          right: -35,
          height: media.height * 0.3,
          child: Image.asset(AppImages.billieHome),
        )
      ],
    );
  }
}
