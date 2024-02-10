// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:wallpaper/app_module/home/view/components/home_components.dart';
// import 'package:wallpaper/services/ads/ads_services.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
import '../../../services/ads/ads_services.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/app_text.dart';
import 'components/home_components.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  BannerAd? _bannerAd;
  String selected = "wallpaper";

  @override
  void initState() {
    print("+++Inhomescreen");
    _createBannerAd();
    _cacheImages();
    super.initState();
  }

  _createBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobServices.bannerAdUnitId!,
        listener: AdMobServices.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  _cacheImages() async {
    final data = Get.arguments;
    final urls = data[1].data()["url"];
    final urlsGif = data[0].data()["url"];

    for (var images in urls) {
      precacheImage(CachedNetworkImageProvider(images['thumbnail']), context);
    }

    for (var images in urls) {
      precacheImage(CachedNetworkImageProvider(images['wallpaper']), context);
    }
    for (var images in urlsGif) {
      precacheImage(CachedNetworkImageProvider(images['thumbnail']), context);
    }
    for (var images in urlsGif) {
      precacheImage(CachedNetworkImageProvider(images['wallpaper']), context);
    }
    log('Images Cached');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        drawer: drawer(Get.arguments),
        drawerEnableOpenDragGesture: false,
        key: scaffoldKey,
        body: Column(
          children: [
            appBar(
              isBack: false,
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            // Container(
            //   height: Get.height / 9,
            //   child: Padding(
            //     padding: const EdgeInsets.all(0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Row(
            //           children: [
            //             const SizedBox(width: 10,),
            //             GestureDetector(
            //               onTap:() {
            //                 scaffoldKey.currentState?.openDrawer();
            //               },
            //               child: Container(
            //                 color: AppColors.TRANSPARENT_COLOR,
            //                 // height: 30,
            //                 width: 23,
            //                 child: Image.asset(
            //                   AppImages.MENU_ICON,
            //                 ),
            //               ),
            //             ),
            //             const Spacer(),
            //             appText(text: selected, fontWeight: FontWeight.w600),
            //             const Spacer(),
            //             Text(selected),
            //             PopupMenuButton<String>(
            //               icon: const Icon(Icons.settings),
            //               onSelected: (String result) {
            //                 setState(() {
            //                   selected = result;
            //                 });
            //                 switch (result) {
            //                   case 'wallpaper':
            //                     break;
            //                   case 'call screen':
            //                     // selected.replaceAll(selected, result);
            //                     break;
            //                   default:
            //                 }
            //               },
            //               itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            //                 const PopupMenuItem<String>(
            //                   value: 'wallpaper',
            //                   child: Text('wallpaper'),
            //                 ),
            //                 const PopupMenuItem<String>(
            //                   value: 'call screen',
            //                   child: Text('call screen'),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
                child: Container(
              color: AppColors.GREY_COLOR.withOpacity(0.5),
              child: gridView(Get.arguments),
            )),
            _bannerAd == null
                ? Container()
                : Container(
                    height: 52,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 15),
                    child: AdWidget(ad: _bannerAd!))
          ],
        ),
      ),
    );
  }
}
