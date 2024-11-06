import 'package:cached_network_image/cached_network_image.dart';
import 'package:expenses_tracker/common/button_play.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_cubit.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_state.dart';
import 'package:expenses_tracker/presentations/music_player/ui/music_sreen.dart';
import 'package:expenses_tracker/utils/const/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/fonts.dart';

class NewsSong extends StatefulWidget {
  final TabController tabController;

  const NewsSong({super.key, required this.tabController});

  @override
  State<NewsSong> createState() => _NewsSongState();
}

class _NewsSongState extends State<NewsSong> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => NewsSongCubit()..getNewsSongs(),
      child: BlocBuilder<NewsSongCubit, NewsSongState>(
        builder: (context, state) {
          // Xử lý khi đang ở trạng thái đang tải
          if (state is NewsSongLoading) {
            return const Center(child: CircularProgressIndicator());

            // Trạng thái lỗi
          } else if (state is NewsSongLoadFailure) {
            return Center(
              child: Text(
                state.message,
                style: kFontTitle(
                  fontSize: 20,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            );

            // Trạng thái đã được tải
          } else if (state is NewsSongLoaded) {
            final songs = state.songs; // Lấy danh sách bài hát từ state

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final song = songs[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => MusicSreen(song: song,))),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: media.height * 0.2,
                              width: media.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    "${AppUrls.coversFireStorage}${song.artist}.png?${AppUrls.mediaAlt}",
                    
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: media.height * 0.02),
                            Text(
                              song.title,
                              overflow: TextOverflow.ellipsis,
                              style: kFontTitle(
                                  fontSize: 16,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                            Text(
                              song.artist,
                              style: kFontSubTitle(
                                  fontSize: 14,
                                  color: context.isDarkMode
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                          ],
                        ),
                        Positioned(
                          child: ButtonPlay(),
                          right: 2,
                          bottom: 60,
                          // right: 0,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
