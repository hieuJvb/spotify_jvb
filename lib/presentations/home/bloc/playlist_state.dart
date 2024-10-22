import 'package:equatable/equatable.dart';

class PlaylistState extends Equatable {
  final bool isPlaying;
  final bool isFavorite;

  const PlaylistState({
    required this.isPlaying,
    required this.isFavorite,
  });

  PlaylistState copyWith({
    bool? isPlaying,
    bool? isFavorite,
  }) {
    return PlaylistState(
      isPlaying: isPlaying ?? this.isPlaying,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [isPlaying, isFavorite];
}
