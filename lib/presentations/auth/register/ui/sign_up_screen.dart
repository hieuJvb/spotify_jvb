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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: SvgPicture.asset(
          AppVectors.logo,
          fit: BoxFit.contain,
          height: media.height * 0.05,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: media.height * 0.02, horizontal: media.width * 0.02),
          child: Column(
            children: [
              Text(
                "Register",
                style: kFontTitle(fontSize: 30, color: Colors.black),
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you need any support",
                    style: kFontSubTitle(fontSize: 12, color: AppColors.black),
                  ),
                  SizedBox(
                    width: media.width * 0.001,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Click here",
                        style: kFontSubTitle(
                            fontSize: 12, color: AppColors.primary),
                      ))
                ],
              ),
              TextFormField(
                // controller: controller.controllerUsername,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  hintStyle: kFontParagraph(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder()
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
