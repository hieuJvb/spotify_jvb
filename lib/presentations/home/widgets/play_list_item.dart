import 'package:expenses_tracker/common/button_play.dart';
import 'package:expenses_tracker/presentations/home/bloc/play_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/const/fonts.dart';
import '../../music_player/ui/music_sreen.dart';
import '../bloc/play_list_cubit.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return const Center(child: CircularProgressIndicator());

            // Trạng thái lỗi
          } else if (state is PlayListLoadFailure) {
            return Center(
              child: Text(
                state.message,
                style: kFontTitle(
                  fontSize: 20,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            );
          } else if (state is PlayListLoaded) {
            final playLists = state.playList;

            return ListView.builder(
                itemCount: playLists.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final playlist = playLists[index];

                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MusicSreen(song: playlist,))),
                    child: Container(
                      child: ListTile(
                        leading: ButtonPlay(),
                        title: Text(
                          playlist.title,
                          style: kFontTitle(
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              playlist.artist,
                              style: kFontSubTitle(
                                  fontSize: 12,
                                  color:
                                      context.isDarkMode ? Colors.white : Colors.black),
                            ),
                            Text(
                              playlist.duration,
                              style: kFontSubTitle(
                                  fontSize: 15,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite), alignment: Alignment.bottomCenter,),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
