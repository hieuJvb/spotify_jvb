import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/common/text_field_line.dart';

import 'package:expenses_tracker/presentations/auth/bloc/auth_cubit.dart';
import 'package:expenses_tracker/presentations/auth/bloc/auth_state.dart';
import 'package:expenses_tracker/presentations/dashboard/ui/dashboard_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../core/configs/assets/app_vector.dart';
import '../../sign_up/ui/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formKeySignIn = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: KeyboardDismisser(
          gestures: [
            GestureType.onTap,

            //kéo màn hình tự đông thu bàn phím
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
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
              body: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                        (route) => false);
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: media.width * 0.05,
                      right: media.width * 0.05,
                      top: media.height * 0.06,
                      bottom: media.height * 0.1),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKeySignIn,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: kFontTitle(
                                fontSize: 30,
                                color: context.isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),

                            SizedBox(height: media.height * 0.01),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "If you need any support",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: context.isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
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

                            SizedBox(height: media.height * 0.02),
                            
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

                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                final isPasswordVisible =
                                    state is AuthPasswordVisibilityChanged &&
                                        state.isPasswordVisible;

                                return Stack(

                                  children: [
                                    TextFieldLine(
                                      controller: _controllerPassword,
                                      hintText: "Password",
                                      isPasswordField: true,
                                      isVisible: isPasswordVisible,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
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
                                );
                              },
                            ),


                            Padding(
                              padding:
                                  EdgeInsets.only(left: media.width * 0.05),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Recovery Password",
                                      style: kFontTitle(
                                          fontSize: 14, color: AppColors.grey),
                                    ),
                                  )),
                            ),

                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return BaseButtonApp(
                                  onPressed: () async {
                                    if (_formKeySignIn.currentState!
                                        .validate()) {
                                      context.read<AuthCubit>().signIn(
                                            _controllerEmail.text,
                                            _controllerPassword.text,
                                          );
                                    }
                                  },
                                  title: "Sign In",
                                );
                              },
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
                                      horizontal: media.width * 0.03),
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
                                  icon: context.isDarkMode
                                      ? SvgPicture.asset(AppVectors.iconAppleDark)
                                      : SvgPicture.asset(
                                      AppVectors.iconAppleLight),

                                ),
                              ],
                            ),
                            SizedBox(height: media.height * 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Not A Member ?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: context.isDarkMode
                                        ? AppColors.white
                                        : AppColors.darkBackground,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Register Now",
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
              ))),
    );
  }
}
