import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/auth/create_user_req.dart';
import 'package:expenses_tracker/data/models/auth/signin_user_req.dart';
import 'package:expenses_tracker/data/sources/auth/auth_firebase_service.dart';
import 'package:expenses_tracker/domain/repository/auth/auth_repository.dart';
import 'package:expenses_tracker/sevice_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }

}