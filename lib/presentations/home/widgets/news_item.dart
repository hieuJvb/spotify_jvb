import 'package:expenses_tracker/common/button_play.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_cubit.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/const/colors.dart';
import '../../../utils/const/fonts.dart';

class NewsItem extends StatelessWidget {

  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.only(right: media.width * 0.0001),
      child: BlocProvider(
        create: (context) => NewsSongCubit()..getNewsSongs(),
        child: BlocBuilder<NewsSongCubit, NewsSongState>(
          builder: (context, state) {

            // Xử lý khi đang ở trạng thái đang tải
            if (state is NewsSongLoading) {
              return Center(child: CircularProgressIndicator());

              // Trạng thái lỗi
            } else if (state is NewsSongLoadFailure) {
              return Center(
                child: Text(
                  "Lỗi lấy dữ liệu!",
                  style: kFontTitle(
                    fontSize: 20,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              );

              // Trạng thái đã được tải
            } else if (state is NewsSongLoaded) {
              final songs = state.songs; // Lấy danh sách bài hát từ state

              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 14),
                physics: BouncingScrollPhysics(),
                itemCount: songs.length,
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final song = songs[index];

                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: media.height * 0.2,
                          //   width: media.width * 0.4,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(30),
                          //     image: DecorationImage(
                          //       image: AssetImage(imagePath),
                          //       fit: BoxFit.contain,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: media.height * 0.02),
                          Text(
                            song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kFontTitle(
                                fontSize: 16, color: AppColors.black),
                          ),
                          Text(
                            song.artist,
                            style: kFontSubTitle(
                                fontSize: 14, color: AppColors.black),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 70,
                        right: 10,
                        child: ButtonPlay(),
                      )
                    ],
                  );
                },
              );
            } else {
              return SizedBox(); // Trả về một widget trống nếu không có trạng thái nào khác
            }
          },
        ),
        ),
    );
  }
}
