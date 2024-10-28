import 'package:expenses_tracker/data/repositories/auth/auth_repository_impl.dart';
import 'package:expenses_tracker/data/repositories/song/song_repository_impl.dart';
import 'package:expenses_tracker/data/sources/song/song_firebase_service.dart';
import 'package:expenses_tracker/domain/repositories/auth/auth_repository.dart';
import 'package:expenses_tracker/domain/repositories/song/song_repository.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_in_usecase.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_up_usecase.dart';
import 'package:expenses_tracker/domain/usecases/song/get_list_song_use_case.dart';
import 'package:expenses_tracker/domain/usecases/song/get_news_song_use_case.dart';
import 'package:get_it/get_it.dart';
import 'data/sources/auth/auth_firebase_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<SongRepository>(SongRepositoryImpl());

  sl.registerSingleton<GetNewsSongUseCase>(GetNewsSongUseCase());

  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
}