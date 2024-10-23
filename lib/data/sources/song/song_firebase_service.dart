import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/song/song.dart';
import 'package:expenses_tracker/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try{

      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      final List<SongEntity> songs = data.docs.map((doc) {
        var songModel = SongModel.fromJson(doc.data());
        return songModel.toEntity();
      }).toList();

      return Right(songs) ;


    }catch(e){

      return Left("Lấy dữ liệu thất bại");
    }
  }
}
