import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/core/usecase/usecase.dart';
import 'package:expenses_tracker/domain/repositories/song/song_repository.dart';

import '../../../service_locator.dart';

// GetNewsSongUseCase Lấy danh sách bài hát mới từ SongRepository
//SongRepository do SongRepositoryImpl ở data layer thực hiện
//SongRepositoryImpl lấy bài hát do SongFirebaseService lấy
//Data khi lấy từ Firebase dạng model(chuyển từ json -> Model) -> entity thông qua mapper

class GetNewsSongUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }

}