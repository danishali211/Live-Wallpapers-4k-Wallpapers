// // import 'dart:html';

// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_cache_manager/file.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:wallpaper_app/services/firebase/firebase.dart';
// import '../../../../main.dart';
// import 'package:path_provider/path_provider.dart';

// String? imageUrl;

// class AndrewOverview extends StatefulWidget {
//   // final String imageUrl;

//   const AndrewOverview({super.key});

//   @override
//   State<AndrewOverview> createState() => _AndrewOverviewState();
// }

// class _AndrewOverviewState extends State<AndrewOverview> {
//   var arguments = Get.arguments;
//   Future<void> _setWallpaper(BuildContext context) async {
//     final PermissionStatus status = await Permission.storage.request();
//     if (status.isGranted) {
//       try {
//         final File cachedImage =
//             await DefaultCacheManager().getSingleFile(arguments['imageUrl']);

//         final WallpaperScreen selectedScreen = await showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Select Screen'),
//                   content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ListTile(
//                         title: const Text('Home Screen'),
//                         onTap: () {
//                           Navigator.of(context)
//                               .pop(WallpaperScreen.HOME_SCREEN);
//                         },
//                       ),
//                       ListTile(
//                         title: const Text('Lock Screen'),
//                         onTap: () {
//                           Navigator.of(context)
//                               .pop(WallpaperScreen.LOCK_SCREEN);
//                         },
//                       ),
//                       ListTile(
//                         title: const Text('Both'),
//                         onTap: () {
//                           Navigator.of(context)
//                               .pop(WallpaperScreen.BOTH_SCREENS);
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ) ??
//             WallpaperScreen.NONE;
//         if (selectedScreen == WallpaperScreen.NONE) {
//           return;
//         }
//         int wallpaperType = WallpaperManager.HOME_SCREEN; // Default value

//         if (selectedScreen == WallpaperScreen.HOME_SCREEN) {
//           wallpaperType = WallpaperManager.HOME_SCREEN;
//         } else if (selectedScreen == WallpaperScreen.LOCK_SCREEN) {
//           wallpaperType = WallpaperManager.LOCK_SCREEN;
//         }

//         final bool result = await WallpaperManager.setWallpaperFromFile(
//           cachedImage.path,
//           wallpaperType,
//         );

//         if (result) {
//           // ScaffoldMessenger.of(context).showSnackBar(
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
//                   Colors.white, // Set the Snackbar background color
//               behavior:
//                   SnackBarBehavior.floating, // Make Snackbar float above the UI
//             ),
//           );
//           getAllUserData(onChange: (onChange) {
//             Get.offNamed("/home", arguments: onChange);
//           });
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'Failed to set wallpaper.',
//                 style: TextStyle(color: Colors.black),
//               ),
//               backgroundColor:
//                   Colors.white, // Set the Snackbar background color
//               behavior:
//                   SnackBarBehavior.floating, // Make Snackbar float above the UI
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
//                 SnackBarBehavior.floating, // Make Snackbar float above the UI
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
//               SnackBarBehavior.floating, // Make Snackbar float above the UI
//         ),
//       );
//     }
//   }

//   Future<void> loadAd() async {
//     await AppOpenAd.load(
//         adUnitId: "ca-app-pub-1842648639714248/5622107789",
//         request: const AdRequest(),
//         adLoadCallback: AppOpenAdLoadCallback(
//           onAdLoaded: (ad) {
//             debugPrint("ad is loaded");
//             openAd = ad;
//             openAd!.show();
//           },
//           onAdFailedToLoad: (error) {
//             debugPrint("ad failed to load");
//           },
//         ),
//         orientation: AppOpenAd.orientationPortrait);
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('this is argument $arguments');
//     final String imageUrl = arguments['imageUrl'];
//     return PopScope(
//       canPop: true,
//       onPopInvoked: (didPop) {
//         getAllUserData(onChange: (onChange) {
//           Get.offNamed("/home", arguments: onChange);
//         });
//       },
//       child: Scaffold(
//         extendBodyBehindAppBar: true,
//         body: Container(
//           constraints: const BoxConstraints.expand(),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Stack(
//               children: [
//                 AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Row(
//                     children: [
//                       const SizedBox(
//                         width: 100,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 15),
//                         height: 50,
//                         width: 150,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.pink),
//                           color: Colors.pinkAccent,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextButton(
//                           onPressed: () async {
//                             await loadAd();
//                             _setWallpaper(context);
//                           },
//                           child: const Text(
//                             "Set as Wallpaper",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum WallpaperScreen {
//   HOME_SCREEN,
//   LOCK_SCREEN,
//   BOTH_SCREENS,
//   NONE,
// }
