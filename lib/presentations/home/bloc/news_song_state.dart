import 'package:equatable/equatable.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';

abstract class NewsSongState extends Equatable {
  const NewsSongState(); // Constructor cho các state con

  @override
  // TODO: implement props
  List<Object?> get props => []; // Cần override props để so sánh state
}

class NewsSongLoading extends NewsSongState {
  const NewsSongLoading();

  @override
  List<Object?> get props => []; // Không có dữ liệu, chỉ cần props trống
}

class NewsSongLoaded extends NewsSongState {
  final List<SongEntity> songs;

  const NewsSongLoaded({required this.songs});

  @override
  List<Object?> get props => [songs]; // So sánh dựa trên danh sách songs
}

class NewsSongLoadFailure extends NewsSongState {

  // final String message;
  //
  // const NewsSongLoadFailure({required this.message});
  //
  // @override
  // // TODO: implement props
  // List<Object?> get props => [message];
}