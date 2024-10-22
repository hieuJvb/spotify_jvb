import 'package:equatable/equatable.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();
}

class TogglePlayEvent extends PlaylistEvent {
  final String songTitle;

  const TogglePlayEvent(this.songTitle);

  @override
  List<Object> get props => [songTitle];
}

class ToggleFavoriteEvent extends PlaylistEvent {
  final String songTitle;

  const ToggleFavoriteEvent(this.songTitle);

  @override
  List<Object> get props => [songTitle];
}
