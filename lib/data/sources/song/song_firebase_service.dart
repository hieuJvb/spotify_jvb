import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/song/song.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';
import 'package:expenses_tracker/presentations/home/bloc/news_song_state.dart';

//Cấu trúc QuerySnapShot
//docs: danh sách tài liệu
//metadata thông tin metadata truy vấn
//size số lượng doc

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try{

      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(4)
          .get();

      final List<SongEntity> songs = data.docs.map((doc) {
        var songModel = SongModel.fromJson(doc.data());
        return songModel.toEntity();
      }).toList();

      print("Fetched Songs: ${songs.map((e) => e.title).toList()}");

      return Right(songs) ;


    }catch(e){
      print("Lỗi: $e");
      return Left(NewsSongLoadFailure(message: "Lỗi: ${e.toString()}"));
    }
  }

  @override
  Future<Either> getPlayList() async {
    try{

      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();

      final List<SongEntity> songs = data.docs.map((doc) {
        var songModel = SongModel.fromJson(doc.data());
        return songModel.toEntity();
      }).toList();

      print("Fetched Songs: ${songs.map((e) => e.title).toList()}");

      return Right(songs) ;


    }catch(e){
      print("Lỗi: $e");
      return Left(NewsSongLoadFailure(message: "Lỗi: ${e.toString()}"));
    }

  }
}
