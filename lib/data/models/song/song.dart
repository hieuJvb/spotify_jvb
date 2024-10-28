import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  String? duration;
  Timestamp? releaseDate;

  SongModel({required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate});

  factory SongModel.fromJson(Map<String, dynamic> data) {
    return SongModel(
      title: data['title'] ?? 'Unknown Title',
      artist: data['artist'] ?? 'Unknown Artist',
      duration: data['duration'] ?? 0,
      releaseDate: data['releaseDate'] ?? 'Unknown Date',
    );
  }
}

extension SongModelX on SongModel{

  SongEntity toEntity() {

    return SongEntity(title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}
