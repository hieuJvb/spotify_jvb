import 'package:expenses_tracker/presentations/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/auth/create_user_req.dart';
import '../../../data/models/auth/signin_user_req.dart';
import '../../../data/sources/auth/auth_firebase_service.dart';
import '../../../service_locator.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(AuthPasswordVisibilityChanged(_isPasswordVisible));
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());

    if (email.isEmpty || password.isEmpty) {
      emit(AuthFailure("Email và mật khẩu không được để trống"));
      return;
    }

    // Nếu không có lỗi, gọi đến AuthFirebaseService
    final result = await sl<AuthFirebaseService>().signIn(SignInUserReq(
      email: email,
      password: password,
    ));


    result.fold(
          (failure) {
        emit(AuthFailure(failure));
      },
          (successMessage) {
        emit(AuthSuccess(successMessage));
      },
    );
  }

  Future<void> signUp(String fullName, String email, String password) async {
    emit(AuthLoading());

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      emit(AuthFailure("Tất cả các trường đều là bắt buộc"));
      return;
    }

    final result = await sl<AuthFirebaseService>().signUp(CreateUserReq(
      fullName: fullName,
      email: email,
      password: password,
    ));

    result.fold(
          (failure) {
        emit(AuthFailure(failure));
      },
          (successMessage) {
        emit(AuthSuccess(successMessage));
      },
    );
  }


}
