// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
          mainAxisSpacing: 17,
          crossAxisSpacing: 15,
          crossAxisCount: 3,
          childAspectRatio: .580),
      itemCount: mainMenuList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            AppImages.menuIndex = index;
            if (index == 0) {
              AppImages.selectedCategory = "Wallpaper";
              type = "offline";
              Get.toNamed("/menu_detail", arguments: [
                mainMenuList[index]["title"],
                data[0].data()["url"],
                index,
              ]);
            } else if (index == 1) {
              AppImages.selectedCategory = "Wallpaper";
              type = "live";
              Get.toNamed("/menu_detail", arguments: [
                mainMenuList[index]["title"],
                data[1].data()["url"],
                index
              ]);
            } else if (index == 2) {
              if (data[2].data()["keyboard"] != "") {
                launch(data[2].data()["keyboard"]);
              }
            } else if (index == 3) {
              if (data[2].data()["premium"] != "") {
                launch(data[2].data()["premium"]);
              }
            } else if (index == 4) {
              // if (data[2].data()["call"] != "") {
              //   launch(data[2].data()["call"]);
              // }
              AppImages.selectedCategory = "Call Wallpaper";
              Get.toNamed("/menu_detail", arguments: [
                mainMenuList[index]["title"],
                data[0].data()["url"],
                index,
              ]);
            }
          },
          // mainMenuList[index]["onTap"],

          child: Column(
            children: [
              // Text('dsafdsfas'),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    SizedBox(child: Image.asset(mainMenuList[index]["icon"])),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   color: Colors.green,
              //     child: appText(text: mainMenuList[index]["title"], size: 12)
              // )
              Container(
                // color: Colors.green,
                child: Text('${mainMenuList[index]["title"]}'),
              )
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
                    ? () {
                        if (data[2].data()["rate"] != "") {
                          launch(data[2].data()["rate"]);
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
