import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:wallpaper/app_module/home/view/components/home_components.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/theme/app_color.dart';
import '../../home/view/components/home_components.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  bool isLoading = true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(isBack: true, title: "Privacy Policy"),
          Expanded(
            child: Stack(
              children: [
                WebView(
                  initialUrl: 'https://metafycial.com/privacy-policy/',
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                isLoading
                    ? Container(
                        height: Get.height,
                        width: Get.width,
                        color: Colors.white,
                        child: loader())
                    : const Stack(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loader() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.35,
        ),
        Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.black26,
          valueColor:
              AlwaysStoppedAnimation<Color>(AppColors.BULE_COLOR //<-- SEE HERE

                  ),
        )),
      ],
    );
  }
}
