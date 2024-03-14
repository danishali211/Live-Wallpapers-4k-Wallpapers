import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/firebase/firebase.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/app_text.dart';
// import 'package:wallpaper/services/firebase/firebase.dart';
// import 'package:wallpaper/utils/constants/images_string.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
// import 'package:wallpaper/utils/widgets/app_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
            () =>
    getAllUserData(onChange: (onChange) {
      Get.offNamed("/home", arguments: onChange);
    })
    );
    // Timer(const Duration(seconds: 2), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.SPLASH_BG), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 25),
              child: Image.asset(
                AppImages.SPLASH_TEXT,
                height: 120,
              ),
            ),
            const Spacer(),
            Center(
                child: appText(
                    text: "I am not lazy i'm just very relaxed",
                    color: Colors.white,
                    size: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: LinearProgressIndicator(
                color: AppColors.BULE_COLOR,
                // value: .6,
                minHeight: 6,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
