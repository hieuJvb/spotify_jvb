import 'package:equatable/equatable.dart';

abstract class MusicPlayerState extends Equatable{
  const MusicPlayerState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MusicPlayerLoading extends MusicPlayerState{
   const MusicPlayerLoading();
}

class MusicPlayerLoadFailure extends MusicPlayerState{
  final String? message;

  MusicPlayerLoadFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class MusicPlayerLoaded extends MusicPlayerState {
  final Duration position;
  final Duration duration;
  final bool isPlaying;

  const MusicPlayerLoaded({
    required this.position,
    required this.duration,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [position, duration, isPlaying];
}