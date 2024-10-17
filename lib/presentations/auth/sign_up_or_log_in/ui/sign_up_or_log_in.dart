import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/core/assets/app_images.dart';
import 'package:expenses_tracker/core/assets/app_vector.dart';
import 'package:expenses_tracker/presentations/auth/register/ui/sign_up_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpOrLogInScreen extends StatelessWidget {
  const SignUpOrLogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBG)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.height * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                  height: media.height * 0.07,
                  width: media.width * 0.45,
                ),
                SizedBox(height: media.height * 0.06),
                Text(
                  "Enjoy listening to music",
                  style: kFontTitle(fontSize: 26, color: AppColors.black),
                ),
                SizedBox(height: media.height * 0.03),
                Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider ",
                  style: kFontTitle(fontSize: 17, color: AppColors.grey),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizedBox(
                  height: media.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: BaseButtonApp(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                            },
                            title: "Register")),
                    SizedBox(
                      width: media.width * 0.2,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign In",
                          style:
                              kFontTitle(fontSize: 19, color: AppColors.black),
                        )),
                  ],
                ),
                SizedBox(height: media.height * 0.25),
              ],
            ),
          )
        ],
      ),
    );
  }
}
