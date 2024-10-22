import 'package:bloc/bloc.dart';
import 'package:expenses_tracker/presentations/home/bloc/play_list_event.dart';
import 'package:expenses_tracker/presentations/home/bloc/playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(const PlaylistState(isPlaying: false, isFavorite: false)) {
    on<TogglePlayEvent>((event, emit) {
      emit(state.copyWith(isPlaying: !state.isPlaying));
    });

    on<ToggleFavoriteEvent>((event, emit) {
      emit(state.copyWith(isFavorite: !state.isFavorite));
    });
  }
}
