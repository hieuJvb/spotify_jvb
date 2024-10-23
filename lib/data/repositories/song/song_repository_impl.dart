import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/sources/song/song_firebase_service.dart';
import 'package:expenses_tracker/domain/repositories/song/song_repository.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSongs() {
    return sl<SongFirebaseService>().getNewsSongs();
  }

}