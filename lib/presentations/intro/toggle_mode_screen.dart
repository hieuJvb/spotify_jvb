import 'package:expenses_tracker/common/icon_arrow_back.dart';
import 'package:expenses_tracker/presentations/auth/sign_up_or_log_in/ui/sign_up_or_log_in.dart';
import 'package:expenses_tracker/presentations/choose_mode/bloc/choose_mode_cubit.dart';
import 'package:expenses_tracker/presentations/intro/widgets/icon_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/base_button_app.dart';
import '../../core/configs/assets/app_images.dart';
import '../../core/configs/assets/app_vector.dart';
import '../../utils/const/colors.dart';
import '../../utils/const/fonts.dart';

class ToggleModeScreen extends StatefulWidget {
  const ToggleModeScreen({super.key});

  @override
  State<ToggleModeScreen> createState() => _ToggleModeScreenState();
}

class _ToggleModeScreenState extends State<ToggleModeScreen> {
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
                  image: AssetImage(AppImages.imageToggleMode),
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
                    "Choose Mode",
                    textAlign: TextAlign.center,
                    style: kFontSubTitle(
                        fontSize: 25, color: AppColors.lightBackground),
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: IconModeWidget(
                          urlVector: AppVectors.moon, title: "Dark Mode",),
                        onTap: () {
                          print("Switching to Dark Mode");
                          context.read<ChooseModeCubit>().updateTheme(ThemeMode.dark);
                        },),
                      SizedBox(
                        width: media.width * 0.18,
                      ),
                      GestureDetector(
                        child: IconModeWidget(

                          urlVector: AppVectors.sun, title: "Light Mode",),
                        onTap: () {
                          print("Switching to Light Mode");
                          context.read<ChooseModeCubit>().updateTheme(ThemeMode.light);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.height * 0.1,
                  ),
                  BaseButtonApp(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpOrLogInScreen()));
                      },
                      title: "Continue"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
