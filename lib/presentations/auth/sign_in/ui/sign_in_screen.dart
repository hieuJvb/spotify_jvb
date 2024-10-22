import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/common/text_field_line.dart';
import 'package:expenses_tracker/data/models/auth/signin_user_req.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_in_usecase.dart';
import 'package:expenses_tracker/presentations/dashboard/ui/dashboard_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../core/configs/assets/app_vector.dart';
import '../../../../sevice_locator.dart';
import '../../sign_up/ui/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return KeyboardDismisser(
        gestures: [
          GestureType.onTap,

          //kéo màn hình tự đông thu bàn phím
          GestureType.onPanUpdateDownDirection,
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const IconArrowBack(),
            title: SvgPicture.asset(
              AppVectors.logo,
              fit: BoxFit.contain,
              height: media.height * 0.04,
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(
                left: media.width * 0.05,
                right: media.width * 0.05,
                top: media.height * 0.06,
                bottom: media.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: kFontTitle(fontSize: 30, color: Colors.black),
                    ),

                    SizedBox(height: media.height * 0.01),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "If you need any support",
                          style:
                              TextStyle(fontSize: 12, color: AppColors.black),
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
                      controller: controllerEmail,
                      hintText: "Enter Email",
                      // validator: (value) {
                      //   if (value == null || value.trim().isEmpty) {
                      //     return 'Vui lòng nhập email';
                      //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                      //       .hasMatch(value)) {
                      //     return 'Vui lòng nhập email hợp lệ';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: media.height * 0.015),
                    Stack(
                      children: [
                        TextFieldLine(
                          controller: controllerPassword,
                          hintText: "Password",
                          isPasswordField: true,
                          // validator: (value) {
                          //   if (value == null || value.trim().isEmpty) {
                          //     return 'Vui lòng nhập mật khẩu';
                          //   } else if (value.length < 6) {
                          //     return 'Mật khẩu phải có ít nhất 6 ký tự';
                          //   }
                          //   return null;
                          // },
                        ),
                        Positioned(
                          top: 8,
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              // context.read<SignUpBloc>().add(TogglePasswordVisibilityEvent());
                            },
                            icon: Icon(
                              // state.isPasswordVisible
                              //     ? Icons.visibility_off_outlined
                              //     :
                              Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height: media.height * 0.01),

                    Padding(
                      padding: EdgeInsets.only(left: media.width * 0.05),
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

                    // BlocBuilder<SignUpBloc, SignUpState>(
                    //   builder: (context, state) {
                    //     if (state.isSubmitting) {
                    //       return const CircularProgressIndicator();
                    //     } else if (state.isFailure) {
                    //       return const Text(
                    //         "Đăng ký không thành công, vui lòng thử lại.",
                    //         style: TextStyle(color: Colors.red),
                    //       );
                    //     } else if (state.isSuccess) {
                    //       return const Text(
                    //         "Đăng ký thành công!",
                    //         style: TextStyle(color: Colors.green),
                    //       );
                    //     }
                    //     return Container();
                    //   },
                    // ),
                    // SizedBox(height: media.height * 0.01),
                    BaseButtonApp(

                      onPressed: () async {
                        var result = await sl<SignInUseCase>().call(
                            params: SignInUserReq(
                                email: controllerEmail.text.toString(),
                                password: controllerPassword.text.toString()));

                        //Xử lý kết quả của Either
                        result.fold((l) {

                          var snackBar = SnackBar(
                              content: Text(
                            l,
                            style: kFontTitle(
                              fontSize: 18,
                              color: AppColors.lightBackground,
                            ),
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar,
                              snackBarAnimationStyle: AnimationStyle(
                                duration: Duration(milliseconds: 50),
                              ));
                        }, (r) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DashboardScreen()),
                              (root) => false);
                        });
                      },
                      title: "Sign In",
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
                          icon: SvgPicture.asset(AppVectors.iconApple),
                        ),
                      ],
                    ),
                    SizedBox(height: media.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not A Member ?",
                          style:
                              TextStyle(fontSize: 14, color: AppColors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register Now",
                            style:
                                TextStyle(fontSize: 14, color: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
