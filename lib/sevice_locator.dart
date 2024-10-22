import 'package:expenses_tracker/data/repositories/auth/auth_repository_impl.dart';
import 'package:expenses_tracker/domain/repository/auth/auth_repository.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_in_usecase.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';
import 'data/sources/auth/auth_firebase_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

}