import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/common/text_field_line.dart';
import 'package:expenses_tracker/presentations/auth/bloc/auth_cubit.dart';
import 'package:expenses_tracker/presentations/auth/bloc/auth_state.dart';
import 'package:expenses_tracker/presentations/auth/sign_in/ui/log_in_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../core/configs/assets/app_vector.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: KeyboardDismisser(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {

            if (state is AuthSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) => false);

            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final isPasswordVisible =
                state is AuthPasswordVisibilityChanged &&
                    state.isPasswordVisible;


            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.isDarkMode
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
                leading: const IconArrowBack(),
                title: SvgPicture.asset(
                  AppVectors.logo,
                  fit: BoxFit.contain,
                  height: media.height * 0.04,
                ),
                centerTitle: true,
              ),
              backgroundColor: context.isDarkMode
                  ? AppColors.darkBackground
                  : AppColors.lightBackground,
              body: Form(
                key: _formKeySignUp,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.05,
                      vertical: media.height * 0.02),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          vertical: media.height * 0.02,
                          horizontal: media.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: kFontTitle(
                                fontSize: 30,
                                color: context.isDarkMode
                                    ? AppColors.white
                                    : AppColors.darkBackground),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "If you need any support",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: context.isDarkMode
                                        ? AppColors.white
                                        : AppColors.darkBackground),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Click here",
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                          TextFieldLine(
                            controller: _controllerUsername,
                            hintText: "Full Name",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Vui lòng nhập tên người dùng';
                              } else if (value.length < 3) {
                                return 'Tên người dùng phải có ít nhất 3 ký tự';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: media.height * 0.015),
                          TextFieldLine(
                            controller: _controllerEmail,
                            hintText: "Enter Email",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Vui lòng nhập email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Vui lòng nhập email hợp lệ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: media.height * 0.015),
                          Stack(
                            children: [
                              TextFieldLine(
                                controller: _controllerPassword,
                                hintText: "Password",
                                isPasswordField: true,
                                isVisible: isPasswordVisible,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Vui lòng nhập mật khẩu';
                                  } else if (value.length < 6) {
                                    return 'Mật khẩu phải có ít nhất 6 ký tự';
                                  }
                                  return null;
                                },
                                toggleVisibility: () {
                                  context
                                      .read<AuthCubit>()
                                      .togglePasswordVisibility();
                                },
                              ),
                            ],
                          ),

                          SizedBox(height: media.height * 0.03),

                          //Nút đăng ký
                          BaseButtonApp(
                            onPressed: () async {
                              if (_formKeySignUp.currentState!.validate()) {
                                context.read<AuthCubit>().signUp(
                                    _controllerUsername.text,
                                    _controllerEmail.text,
                                    _controllerPassword.text);
                              }
                            },
                            title: "Create Account",
                          ),

                          SizedBox(height: media.height * 0.03),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                    thickness: 1,
                                    color: AppColors.grey.withOpacity(0.3)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: media.width * 0.02),
                                child: const Text("Or"),
                              ),
                              Expanded(
                                child: Divider(
                                    thickness: 1,
                                    color: AppColors.grey.withOpacity(0.3)),
                              ),
                            ],
                          ),
                          SizedBox(height: media.height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppVectors.iconGoogle),
                              ),
                              SizedBox(width: media.width * 0.15),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(AppVectors.iconApple),
                              ),
                            ],
                          ),
                          SizedBox(height: media.height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Do you have an account?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: context.isDarkMode
                                        ? AppColors.white
                                        : AppColors.darkBackground),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SignInScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
