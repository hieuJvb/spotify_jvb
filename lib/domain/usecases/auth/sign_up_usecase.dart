import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/auth/create_user_req.dart';
import 'package:expenses_tracker/domain/repository/auth/auth_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../../../sevice_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq>{

  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
  
}