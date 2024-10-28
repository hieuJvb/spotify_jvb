// import 'dart:collection';
//
// import 'package:expenses_tracker/presentations/music_player/bloc/music_player_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';
//
// class MusicPlayerCubit extends Cubit<MusicPlayerState> {
//   final player = AudioPlayer();
//
//   Duration songDuration = Duration.zero;
//   Duration songPosition = Duration.zero;
//
//   MusicPlayerCubit() : super(MusicPlayerLoading()) {
//
//     player.positionStream.listen((position) {
//       songPosition =  position;
//       updateMusicPlayer();
//     });
//
//     player.durationStream.listen((duration) {
//       songDuration = duration!;
//     });
//   }
//
//   void updateMusicPlayer() {
//     emit(MusicPlayerLoaded());
//   }
//
//   Future<void> getSongs(String url) async {
//     try {
//       await player.setUrl(url);
//       emit(MusicPlayerLoaded());
//     } catch (e) {
//       emit(MusicPlayerLoadFailure(message: e.toString()));
//     }
//   }
//
//   Future<void> playOrPause() async {
//     await player.playing ? player.stop() : player.play();
//
//     emit(MusicPlayerLoaded());
//   }
//
//   @override
//   Future<void> close() {
//     player.dispose();
//     // TODO: implement close
//     return super.close();
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  final player = AudioPlayer();

  MusicPlayerCubit() : super(const MusicPlayerLoading()) {
    player.positionStream.listen((position) {
      emitMusicState(position: position);
    });

    player.durationStream.listen((duration) {
      if (duration != null) {
        emitMusicState(duration: duration);
      }
    });
  }

  Future<void> getSongs(String url) async {
    try {
      await player.setUrl(url);
      emitMusicState();
    } catch (e) {
      emit(MusicPlayerLoadFailure(message: e.toString()));
    }
  }

  void emitMusicState({Duration? position, Duration? duration}) {
    emit(
      MusicPlayerLoaded(
        position: position ?? player.position,
        duration: duration ?? player.duration ?? Duration.zero,
        isPlaying: player.playing,
      ),
    );
  }

  Future<void> playOrPause() async {
    await player.playing ? player.pause() : player.play();
    emitMusicState(); // Cập nhật trạng thái sau khi play/pause
  }

  @override
  Future<void> close() {
    player.dispose();
    return super.close();
  }
}
