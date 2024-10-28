import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/core/usecase/usecase.dart';
import 'package:expenses_tracker/domain/repositories/song/song_repository.dart';

import '../../../service_locator.dart';

class GetPlayListUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getPlayList();
  }

}