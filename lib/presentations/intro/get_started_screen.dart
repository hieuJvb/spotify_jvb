import 'package:expenses_tracker/common/base_button_app.dart';
import 'package:expenses_tracker/presentations/intro/toggle_mode_screen.dart';
import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:expenses_tracker/utils/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/assets/app_images.dart';
import '../../core/configs/assets/app_vector.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.imageGetStarted),
            )),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: media.height * 0.03,
                  bottom: media.height * 0.08,
                  left: media.height * 0.03,
                  right: media.height * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                    width: media.width * 0.1,
                    height: media.height * 0.05,
                  ),
                  const Spacer(),
                  Text(
                    "Enjoy Listening To Music",
                    textAlign: TextAlign.center,
                    style: kFontSubTitle(
                        fontSize: 25, color: AppColors.lightBackground),
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim\n purus sed phasellus. Cursus ornare id\n scelerisque aliquam.",
                    style: kFontParagraph(fontSize: 17, color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  BaseButtonApp(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ToggleModeScreen()));
                      },
                      title: "Get Started"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
