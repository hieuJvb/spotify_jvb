import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/auth/signin_user_req.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repositories/auth/auth_repository.dart';

class SignInUseCase implements UseCase<Either, SignInUserReq>{

  @override
  Future<Either> call({SignInUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }

}