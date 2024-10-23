import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:expenses_tracker/data/models/auth/create_user_req.dart';
import 'package:expenses_tracker/data/models/auth/signin_user_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> signIn(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    try {

     await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserReq.email, password: signInUserReq.password);


      return Right("Đăng nhập thành công");

    } on FirebaseAuthException catch (e) {

      String message = "";

      if(e.code == "invalid-email"){
        message = "Email không hợp lệ";
      }else if (e.code == "invalid-credential") {
        message = "Sai mật khẩu";
      }

      return Left(message);
    }
  }
  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {

    try {

      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);


      // Thêm thông tin vào Firestore
      await FirebaseFirestore.instance.collection('users').add({
        "name": createUserReq.fullName,
        "email": data.user?.email ?? "No Email",
      });


      return Right("Đăng ký thành công");

    } on FirebaseAuthException catch (e) {

      String message = "";

      if(e.code == "weak-password"){
        message = "Mật khẩu quá yếu";
      }else if (e.code == "email-already-in-use") {
        message = "Email này đã được sử dụng";
      }

      return Left(message);
    }
  }

}
