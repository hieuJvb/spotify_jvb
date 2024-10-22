import 'package:expenses_tracker/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/assets/app_vector.dart';
import '../../intro/get_started_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Center(
        child: SvgPicture.asset(AppVectors.logo,height: media.height * 0.1, width: media.width * 0.5,),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const GetStartedScreen()));
  }
}
