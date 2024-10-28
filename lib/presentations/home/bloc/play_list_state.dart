import 'package:equatable/equatable.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';

abstract class PlayListState extends Equatable {
  const PlayListState();

  @override
  // TODO: implement props
  List<Object?> get props => []; // Cần override props để so sánh state
}

class PlayListLoading extends PlayListState {
  const PlayListLoading();

  @override
  List<Object?> get props => []; // Không có dữ liệu, chỉ cần props trống
}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> playList;

  const PlayListLoaded({required this.playList});

  @override
  List<Object?> get props => [playList]; // So sánh dựa trên danh sách songs
}

class PlayListLoadFailure extends PlayListState {

  final String message;

  const PlayListLoadFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}