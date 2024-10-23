import 'package:expenses_tracker/domain/usecases/song/get_news_song.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class NewsSongCubit extends Cubit<NewsSongState> {

  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSongs() async {
    try {
      var returnedSongs = await sl<GetNewsSongUseCase>().call();

      //fold xử lý kết quả
      returnedSongs.fold(
              (failure) {
                emit(NewsSongLoadFailure());
              },
              (songs) {
                emit(NewsSongLoaded(songs: songs));
              });
    } catch (e) {

    }
  }
}
