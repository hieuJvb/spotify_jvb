
import 'package:expenses_tracker/domain/usecases/song/get_list_song_use_case.dart';
import 'package:expenses_tracker/presentations/home/bloc/play_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async{

    try{
      var returnedPlayList = await sl<GetPlayListUseCase>().call();

      returnedPlayList.fold((failure){
        emit(PlayListLoadFailure(message: failure));
      }, (playList){
        emit(PlayListLoaded(playList: playList));
      });

    }catch(e){
      print(e);
    }
  }
}
