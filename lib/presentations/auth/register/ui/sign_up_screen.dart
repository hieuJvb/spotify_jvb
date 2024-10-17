import 'package:expenses_tracker/core/assets/app_vector.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: media.height * 0.02, horizontal: media.width * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                  const Spacer(),
                  Center(
                    child: Container(
                      height: media.height * 0.2,
                      width: media.width * 0.5,
                      child: SvgPicture.asset(
                        AppVectors.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Text(
                "REGISTER",
                style: kFontTitle(fontSize: 28, color: Colors.black),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              TextFormField(
                // controller: controller.controllerUsername,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  hintStyle: kFontParagraph(fontSize: 16, color: Colors.grey),
                ),
                // validator: (value) {
                //   return(value == null || value.trim().isEmpty) ? "Invalid UserName" : null;
                // },
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              TextFormField(
                maxLength: 50,
                initialValue: "Enter Email",
                style: kFontParagraph(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Stack(
                children: [
                  TextFormField(
                    obscureText: true,
                    initialValue: "Password",
                    style: kFontParagraph(fontSize: 16, color: AppColors.grey),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle:
                          kFontParagraph(fontSize: 16, color: AppColors.grey),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: -8,
                    child: IconButton(
                        onPressed: () {
                          // controller.togglePassword();
                        },
                        icon:
                            // controller.isTogglePassword.value
                            //     ? Icon(Icons.visibility_off_outlined)
                            //     :
                            Icon(Icons.visibility_outlined)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
