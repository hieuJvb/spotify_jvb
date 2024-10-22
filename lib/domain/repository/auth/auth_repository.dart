import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/auth/create_user_req.dart';
import 'package:expenses_tracker/data/models/auth/signin_user_req.dart';

abstract class AuthRepository{
    Future<Either> signIn(SignInUserReq signInUserReq);

    //Either trả về thành công hoặc thất bại
    //Right: Thành công
    //Left: Thất bại
    Future<Either> signup(CreateUserReq createUserReq);

}