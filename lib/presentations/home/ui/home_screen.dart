import 'package:expenses_tracker/common/button_play.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../widgets/new_item.dart';
import '../widgets/play_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    final List<NewsItem> listNewsItems = [
      NewsItem(
        imagePath: AppImages.home1,
        title: 'Bad Guy',
        artist: 'Billie Eilish',
      ),
      NewsItem(
        imagePath: AppImages.home2,
        title: 'Scorpion',
        artist: 'Drake',
      ),
      NewsItem(
        imagePath: AppImages.home3,
        title: 'WHO',
        artist: 'Artist Name',
      ),
    ];

    final List<PlaylistItem> listPlayListItems = [
      PlaylistItem(
        songTitle: "As It Was",
        artist: "Harry Styles",
        duration: "5:33",
        isPlaying: true,
        isFavorite: false,
      ),
      PlaylistItem(
        songTitle: "God Did",
        artist: "DJ Khaled",
        duration: "3:43",
        isPlaying: false,
        isFavorite: false,
      ),
    ];

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
                  // New Album
                  Container(
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
                  ),
                  SizedBox(height: media.height * 0.04),

                  // News Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("News",
                          style:
                              kFontTitle(fontSize: 20, color: AppColors.black)),
                      Text(
                        "Video",
                        style: kFontTitle(
                            fontSize: 20,
                            color: AppColors.grey.withOpacity(0.3)),
                      ),
                      Text(
                        "Artists",
                        style: kFontTitle(
                            fontSize: 20,
                            color: AppColors.grey.withOpacity(0.3)),
                      ),
                      Text(
                        "Podcast",
                        style: kFontTitle(
                            fontSize: 20,
                            color: AppColors.grey.withOpacity(0.3)),
                      ),
                    ],
                  ),
                  SizedBox(height: media.height * 0.02),
                  SizedBox(
                      height: media.height * 0.3,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: listNewsItems.length,
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            final newsItem = listNewsItems[index];
                            return Padding(
                              padding:
                                  EdgeInsets.only(right: media.width * 0.0001),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: media.height * 0.2,
                                        width: media.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(newsItem.imagePath),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: media.height * 0.02),
                                      Text(
                                        newsItem.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: kFontTitle(
                                            fontSize: 16,
                                            color: AppColors.black),
                                      ),
                                      Text(
                                        newsItem.artist,
                                        style: kFontSubTitle(
                                            fontSize: 14,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    right: 10,
                                    child: ButtonPlay(),
                                  )
                                ],
                              ),
                            );
                          })),

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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listPlayListItems.length,
                    itemBuilder: (context, index) {
                      final playListItem = listPlayListItems[index];
                      return ListTile(
                        leading:
                            IconButton(onPressed: () {}, icon: ButtonPlay()),
                        title: Text(playListItem.songTitle),
                        subtitle: Text(playListItem.artist),
                        trailing: Text(playListItem.duration),
                        tileColor: playListItem.isPlaying
                            ? AppColors.lightBackground
                            : null,
                      );
                    },
                  ),
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
