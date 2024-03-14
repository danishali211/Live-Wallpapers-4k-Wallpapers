// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_app/app_module/grid_screens/gridview_screen.dart';
import 'package:wallpaper_app/app_module/menu_detail/controller/menu_detail_view.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/theme/app_color.dart';
import '../../../../utils/widgets/app_text.dart';
import '../../../wallpaper_detail/view/wallppper_detail_view.dart';
import '../../model/home_model.dart';
// import 'package:wallpaper/app_module/home/model/home_model.dart';
// import 'package:wallpaper/app_module/wallpaper_detail/view/wallppper_detail_view.dart';
// import 'package:wallpaper/utils/constants/images_string.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
// import 'package:wallpaper/utils/widgets/app_text.dart';

//   AppBar
Widget appBar(
    {bool isBack = true,
    String? title,
    VoidCallback? onTap,
    bool isSufix = true}) {
  return Container(
    height: Get.height / 9,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child: Container(
                  color: AppColors.TRANSPARENT_COLOR,
                  // height: 30,
                  width: 23,
                  child: Image.asset(
                    isBack ? AppImages.BACK_ICON : AppImages.MENU_ICON,
                  ),
                ),
              ),
              isSufix
                  ? const Spacer()
                  : const SizedBox(
                      width: 15,
                    ),
              appText(text: title ?? "Wallpaper", fontWeight: FontWeight.w600),
              isSufix ? const Spacer() : Container(),
            ],
          ),
        ],
      ),
    ),
  );
}

//  Grid View

Widget gridView(data) {
  // final controller = Get.put(MenuDetailController());

  return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 7,
        crossAxisSpacing: 15,
        crossAxisCount: 3,
        mainAxisExtent: 250,
      ),
      itemCount: mainMenuList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            AppImages.menuIndex = index;


            ///Index 0 has Live wallpapers in our app
            ///to apply live wallpapers we have to make the flag 'isLive=true'
            ///for static wallpaper we have to make the 'isLive=false'
            if (index == 0) {
              // Get.put(MenuDetailController()).showInterstitialAd();
              AppImages.selectedCategory = "Wallpaper";
              type = "Live";
              Get.to(
                () => GridViewScreens(
                  source: data[1].data()["url"],
                  title: mainMenuList[index]["title"],
                  isLive: true,
                ),
              );
            } else if (index == 1) {
              // Get.put(MenuDetailController()).showInterstitialAd();
              AppImages.selectedCategory = "Wallpaper";
              type = "live";

              Get.to(
                () => GridViewScreens(
                  source: data[0].data()["url"],
                  title: mainMenuList[index]["title"],
                  isLive: false,
                ),
              );
            } else if (index >= 2) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Comming Soon!!!'),
                  content: const Text(
                      'We are working on it.Soon in upcoming versions we will add these functionalities'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  mainMenuList[index]["icon"],
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              const SizedBox(height: 5),
              Text('${mainMenuList[index]["title"]}')
            ],
          ),
        );
      });
}

//  Drawer

Widget drawer(data) {
  return Drawer(
    width: Get.width / 1.8,
    child: Container(
      color: AppColors.GREY_COLOR.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: Get.width / 1.8,
            decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35, left: 16),
                  child: appText(text: "Wallpaper", size: 30),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: drawerMenuList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: index == 0
                    ? () async {
                        // Example, rate us : https://play.google.com/store/apps/details?id=+PACKAGE NAME
                        const url =
                            'https://play.google.com/store/apps/details?id=com.metafycial.apps.wallpaperapp';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    : index == 1
                        ? () {
                            if (data[2].data()["share"] != "") {
                              launch(data[2].data()["share"]);
                              Share.share(data[2].data()["share"].toString(),
                                  subject: 'Wallpaper');
                            }
                          }
                        : drawerMenuList[index]["onTap"],
                child: Padding(
                  padding: const EdgeInsets.only(top: 23, left: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            color: AppColors.GREY_COLOR,
                            shape: BoxShape.circle),
                        child: Image.asset(drawerMenuList[index]["icon"]),
                      ),
                      appText(text: drawerMenuList[index]["title"], size: 18)
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    ),
  );
}
