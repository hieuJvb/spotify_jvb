import 'package:expenses_tracker/common/button_play.dart';
import 'package:expenses_tracker/presentations/home/widgets/card_header.dart';
import 'package:expenses_tracker/presentations/home/widgets/widget_tab.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../widgets/news_item.dart';
import '../widgets/play_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightBackground,
            title: SvgPicture.asset(AppVectors.logo,
                fit: BoxFit.contain, height: media.height * 0.04),
            leading: IconButton(
              icon: Icon(Icons.search, color: AppColors.black),
              onPressed: () {},
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
            ],
            centerTitle: true,
          ),
          backgroundColor: AppColors.lightBackground,
          // backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: media.height * 0.03,
                  horizontal: media.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Header
                  CardHeader(),

                  SizedBox(height: media.height * 0.04),

                  //chuyển tab từ news -> video -> artists -> podcast
                  WidgetTab(),

                  SizedBox(height: media.height * 0.02),

                  TabBarView(
                      children: [
                    NewsItem(),
                        Container(),
                        Container(),
                        Container()

                  ]),

                  //News Item

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Playlist",
                          style:
                              kFontTitle(fontSize: 20, color: AppColors.black)),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See More",
                          style: kFontSubTitle(
                              fontSize: 12, color: AppColors.grey),
                        ),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: listPlayListItems.length,
                  //   itemBuilder: (context, index) {
                  //     final playListItem = listPlayListItems[index];
                  //     return ListTile(
                  //       leading:
                  //           IconButton(onPressed: () {}, icon: ButtonPlay()),
                  //       title: Text(playListItem.songTitle),
                  //       subtitle: Text(playListItem.artist),
                  //       trailing: Text(playListItem.duration),
                  //       tileColor: playListItem.isPlaying
                  //           ? AppColors.lightBackground
                  //           : null,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -25,
          right: -40,
          // child: Image.asset(AppImages.imageBillie,),
          child: Image.asset(AppImages.billieHome),
          height: media.height * 0.3,
        )
      ],
    );
  }
}
