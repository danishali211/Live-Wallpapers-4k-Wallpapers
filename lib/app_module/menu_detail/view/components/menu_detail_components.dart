// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/theme/app_color.dart';
import '../../../../utils/widgets/app_text.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
// import 'package:wallpaper/utils/widgets/app_text.dart';
// import 'package:wallpaper/utils/constants/images_string.dart';

// Widget detailGridView({required List dataList}) {
//   return dataList.isEmpty
//       ? SizedBox(
//           height: 400,
//           child: Center(child: appText(text: "Data not found")),
//         )
//       : GridView.builder(
//           padding:
//               const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 16),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 8,
//               crossAxisCount: 3,
//               mainAxisSpacing: 15,
//               childAspectRatio: .62),
//           itemCount: dataList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 AppImages.detailIndex = index;
//                 Get.toNamed("/wallpaper_detail", arguments: dataList[index]);
//               },
//               // mainMenuList[index]["onTap"],
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.WHITE_COLOR,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10)),
//                       child: SizedBox(
//                           height: 150,
//                           width: Get.width,
//                           child: CachedNetworkImage(
//                             imageUrl: dataList[index]['wallpaper'],
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => Center(
//                                 child: CircularProgressIndicator(
//                               color: AppColors.BULE_COLOR,
//                             )),
//                             errorWidget: (context, url, error) =>
//                                 const Icon(Icons.error),
//                           )
//                           //  Image.network(
//                           //   dataList[index],
//                           //   fit: BoxFit.cover,
//                           // ),
//                           ),
//                     ),
//                     const Spacer(),
//                     appText(text: "Apply", size: 13),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             );
//           });
// }

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.height,
      this.width,
      required this.title,
      this.onTap,
      this.color1,
      this.textcolor});
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  Color? color1;
  Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.82,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          primary: color1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: textcolor),
        ),
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: InkWell(
    //     onTap: onTap,
    //     child: Container(
    //       height: height,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: color,
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       child: loading ? Center(child: CircularProgressIndicator(color: Colors.white,)) :Center(
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

// class AndrewOverview extends StatelessWidget {
//   final String imageUrl;
//
//   const AndrewOverview({super.key, required this.imageUrl});
//
//   Future<void> _setWallpaper(BuildContext context) async {
//     final PermissionStatus status = await Permission.storage.request();
//     if (status.isGranted) {
//       try {
//         final File cachedImage =
//         await DefaultCacheManager().getSingleFile(imageUrl);
//
//         // ignore: use_build_context_synchronously
//         final WallpaperScreen selectedScreen = await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Select Screen'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     title: const Text('Home Screen'),
//                     onTap: () {
//                       Navigator.of(context).pop(WallpaperScreen.HOME_SCREEN);
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Lock Screen'),
//                     onTap: () {
//                       Navigator.of(context).pop(WallpaperScreen.LOCK_SCREEN);
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Both'),
//                     onTap: () {
//                       Navigator.of(context).pop(WallpaperScreen.BOTH_SCREENS);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//
//         int wallpaperType = WallpaperManager.HOME_SCREEN; // Default value
//
//         if (selectedScreen == WallpaperScreen.HOME_SCREEN) {
//           wallpaperType = WallpaperManager.HOME_SCREEN;
//         } else if (selectedScreen == WallpaperScreen.LOCK_SCREEN) {
//           wallpaperType = WallpaperManager.LOCK_SCREEN;
//         }
//
//         final bool result = await WallpaperManager.setWallpaperFromFile(
//           cachedImage.path,
//           wallpaperType,
//         );
//
//         if (result) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Row(
//                 children: [
//                   Text(
//                     'Wallpaper added to your screen!',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),
//               backgroundColor:
//               Colors.white, // Set the Snackbar background color
//               behavior:
//               SnackBarBehavior.floating, // Make Snackbar float above the UI
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'Failed to set wallpaper.',
//                 style: TextStyle(color: Colors.black),
//               ),
//               backgroundColor:
//               Colors.white, // Set the Snackbar background color
//               behavior:
//               SnackBarBehavior.floating, // Make Snackbar float above the UI
//             ),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               'Error: $e',
//               style: const TextStyle(color: Colors.black),
//             ),
//             backgroundColor: Colors.white, // Set the Snackbar background color
//             behavior:
//             SnackBarBehavior.floating, // Make Snackbar float above the UI
//           ),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Permission denied. Wallpaper cannot be set.',
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.white, // Set the Snackbar background color
//           behavior:
//           SnackBarBehavior.floating, // Make Snackbar float above the UI
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Container(
//         constraints: const BoxConstraints.expand(),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Stack(
//             children: [
//               AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 100,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 15),
//                       height: 50,
//                       width: 150,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.pink),
//                         color: Colors.pinkAccent,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextButton(
//                         onPressed: () async {
//                           await AdManager.showIntAd();
//                           _setWallpaper(context);
//                         },
//                         child: const Text(
//                           "Set as Wallpaper",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// enum WallpaperScreen {
//   HOME_SCREEN,
//   LOCK_SCREEN,
//   BOTH_SCREENS,
// }
