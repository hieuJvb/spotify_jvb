import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/common/text_field_line.dart';
import 'package:expenses_tracker/data/models/auth/create_user_req.dart';
import 'package:expenses_tracker/domain/usecases/auth/sign_up_usecase.dart';
import 'package:expenses_tracker/presentations/auth/sign_in/ui/sign_in_screen.dart';
import 'package:expenses_tracker/presentations/dashboard/ui/dashboard_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../core/configs/assets/app_vector.dart';
import '../../../../service_locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerPassword.dispose();
    controllerUsername.dispose();
    controllerEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return KeyboardDismisser(
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
          padding: EdgeInsets.symmetric(
              horizontal: media.width * 0.05, vertical: media.height * 0.02),
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
                    style: kFontTitle(fontSize: 30, color: Colors.black),
                  ),
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
                  TextFieldLine(
                    controller: controllerUsername,
                    hintText:  "Full Name",
                    // validator: (value) {
                    //   if (value == null || value.trim().isEmpty) {
                    //     return 'Vui lòng nhập tên người dùng';
                    //   } else if (value.length < 3) {
                    //     return 'Tên người dùng phải có ít nhất 3 ký tự';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: media.height * 0.015),
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
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off_outlined
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: media.height * 0.03),

                  //Nút đăng ký
                  BaseButtonApp(
                    onPressed: () async {
                      var result = await sl<SignUpUseCase>().call(
                          params: CreateUserReq(
                              fullName: controllerUsername.text.toString(),
                              email: controllerEmail.text.toString(),
                              password: controllerPassword.text.toString()));

                      //Xử lý kết quả của Either
                      result.fold((l) {
                        var snackBar = SnackBar(content: Text(l, style: kFontTitle(fontSize: 18, color: AppColors.lightBackground,),));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar,snackBarAnimationStyle: AnimationStyle(
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
                      const Text(
                        "Do you have an account?",
                        style:
                            TextStyle(fontSize: 14, color: AppColors.black),
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
      ),
    );
  }
}
