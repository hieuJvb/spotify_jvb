import 'package:cached_network_image/cached_network_image.dart';
import 'package:expenses_tracker/common/custom_app_bar.dart';
import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';
import 'package:expenses_tracker/presentations/music_player/bloc/music_player_cubit.dart';
import 'package:expenses_tracker/presentations/music_player/bloc/music_player_state.dart';
import 'package:expenses_tracker/presentations/music_player/widgets/forward_widget.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../utils/const/app_urls.dart';
import '../../../utils/const/colors.dart';

class MusicSreen extends StatefulWidget {
  final SongEntity? song;

  const MusicSreen({super.key, required this.song});

  @override
  State<MusicSreen> createState() => _MusicSreenState();
}

class _MusicSreenState extends State<MusicSreen> {
  late MusicPlayerCubit musicPlayerCubit;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => MusicPlayerCubit()
        ..getSongs(
            "${AppUrls.songsFireStorage}${widget.song?.artist}.mp3?${AppUrls.mediaAlt}"),
      child: BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
        builder: (context, state) {
          if (state is MusicPlayerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MusicPlayerLoadFailure) {
            return Text(
              state.message ?? 'Không thể tải bài hát',
              style: kFontTitle(fontSize: 20, color: AppColors.black),
            );
          } else if (state is MusicPlayerLoaded) {
            return Scaffold(
              appBar: CustomAppBar(
                icon: IconArrowBack(),
                title: Text(
                  "Now Playing",
                  style: kFontTitle(
                    fontSize: 18,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                onSearchPressed: () {},
                onMorePressed: () {},
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _musicCover(),
                    SizedBox(height: media.height * 0.02),
                    _musicDetail(),
                    SizedBox(height: media.height * 0.02),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 8),
                        overlayShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                      ),
                      child: Slider(
                        activeColor: Colors.grey.shade700,
                        value: state.position.inSeconds.toDouble(),
                        min: 0.0,
                        max: state.duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          context
                              .read<MusicPlayerCubit>()
                              .player
                              .seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatDuration(state.position)),
                        Text(formatDuration(state.duration)),
                      ],
                    ),
                    SizedBox(height: media.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ForwardWidget(onPressed: () {
                          context.read<MusicPlayerCubit>().seekBackward();
                        }),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 22.69, right: 44),
                          child: GestureDetector(
                            onTap: () =>
                                context.read<MusicPlayerCubit>().playOrPause(),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: Icon(
                                state.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Transform(
                            transform: Matrix4.identity()..scale(-1.0, 1.0),
                            child: ForwardWidget(onPressed: () {
                              context.read<MusicPlayerCubit>().seekForward();
                            })),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _musicCover() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: CachedNetworkImage(
        imageUrl:
            "${AppUrls.coversFireStorage}${widget.song?.artist}.png?${AppUrls.mediaAlt}",
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, err) => Center(
          child: Icon(Icons.error_outline),
        ),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _musicDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.song!.title,
              style: kFontTitle(
                  fontSize: 20,
                  color:
                      context.isDarkMode ? AppColors.white : AppColors.black),
            ),
            Text(
              widget.song!.artist,
              style: kFontSubTitle(
                  fontSize: 20,
                  color:
                      context.isDarkMode ? AppColors.white : AppColors.black),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      ],
    );
  }

  String formatDuration(Duration duration) {
    final seconds = duration.inSeconds.remainder(60);
    final minutes = duration.inMinutes.remainder(60);

    /// Pads this string on the right if it is shorter than [width].

    /// Returns a new string that appends [padding] after this string
    /// one time for each position the length is less than [width].
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
