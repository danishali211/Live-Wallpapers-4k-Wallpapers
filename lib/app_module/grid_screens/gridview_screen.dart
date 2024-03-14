import 'dart:developer';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:motion/motion.dart';
import 'package:wallpaper_app/app_module/menu_detail/controller/menu_detail_view.dart';
import 'package:wallpaper_app/app_module/menu_detail/view/components/menu_detail_components.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/services/firebase/firebase.dart';
import 'package:wallpaper_app/utils/theme/app_color.dart';

class GridViewScreens extends StatelessWidget {
  const GridViewScreens({
    super.key,
    required this.source,
    this.title,
    required this.isLive,
  });

  final List<dynamic> source;
  final String? title;
  final bool isLive;
  @override
  Widget build(BuildContext context) {
    print('this is source ${source}= ${title} = ${isLive}');
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        await getAllUserData(onChange: (onChange) {
          Get.offNamed("/home", arguments: onChange);
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await getAllUserData(onChange: (onChange) {
                Get.offNamed("/home", arguments: onChange);
              });
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(title ?? ''),
        ),
        body: GridView.builder(
          itemCount: source.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            mainAxisExtent: 300,
            crossAxisSpacing: 5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Get.to(
              () => WallPaperScreen(
                imageData: source[index],
                isLive: isLive,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: source[index]['thumbnail'],
                  errorWidget: (context, url, error) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WallPaperScreen extends StatefulWidget {
  const WallPaperScreen({
    super.key,
    required this.imageData,
    required this.isLive,
  });
  final Map imageData;
  final bool isLive;
  @override
  State<WallPaperScreen> createState() => _WallPaperScreenState();
}

class _WallPaperScreenState extends State<WallPaperScreen> {
  String liveWallpaper = 'Unknown';

  @override
  void initState() {
    super.initState();
    // loadAd();
    Get.put(MenuDetailController()).loadRewardAd();
    print('this is imageMap ${widget.imageData}');
  }

  @override
  Widget build(BuildContext context) {
    final imageData = widget.imageData;
    final isLive = widget.isLive;
    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Motion.elevated(
                elevation: 85,
                child: CachedNetworkImage(
                  height: 560,
                  imageUrl: imageData['wallpaper'],
                  errorWidget: (context, url, error) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Icon(Icons.error), Text('$error')],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: 'Download',
                color1: Colors.blue,
                textcolor: Colors.white,
                onTap: () async {
                  bool loading = false;
                  showAdaptiveDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) => AlertDialog.adaptive(
                        title: const Text('Apply Wallpaper'),
                        content: const Text('Watch Ad to Download wallpaper'),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          loading
                              ? const CircularProgressIndicator()
                              : OutlinedButton.icon(
                                  onPressed: () async {
                                    String result;
                                    setState(() {
                                      loading = true;
                                    });

                                    await Get.put(MenuDetailController())
                                        .showRewardAd(context,
                                            onAdRewared: () async {
                                      try {
                                        try {
                                          if (isLive) {
                                            var file =
                                                await DefaultCacheManager()
                                                    .getSingleFile(
                                                        imageData['preview']);

                                            debugPrint(file.path);
                                            result = await AsyncWallpaper
                                                    .setLiveWallpaper(
                                              filePath: file.path,
                                              goToHome: false,
                                              // toastDetails: ToastDetails(
                                              //   message:
                                              //       '',
                                              //   backgroundColor:
                                              //       AppColors.WHITE_COLOR,
                                              //   textColor: AppColors.BULE_COLOR,
                                              // ),
                                              errorToastDetails:
                                                  ToastDetails.error(),
                                            )
                                                ? 'Wallpaper set'
                                                : 'Failed to get wallpaper.';

                                            if (!mounted) return;

                                            setState(() {
                                              liveWallpaper = result;
                                              print("+++wallpaper is set ");
                                            });
                                          } else {
                                            //   //   liveWallpaper = '';
                                            //   //   Get.toNamed(
                                            //   //     '/setWallpaper',
                                            //   //     arguments: {
                                            //   //       'imageUrl': imageData['thumbnail']
                                            //   //     },
                                            //   //   );
                                            //   // }
                                            //
                                            //   final screen = await selectScreen();
                                            //
                                            //   if (screen != null) {
                                            //     print('this is wallpaper url ${imageData['wallpaper']}');
                                            //     result = await AsyncWallpaper
                                            //             .setWallpaper(
                                            //       url: imageData['wallpaper'],
                                            //       wallpaperLocation: screen,
                                            //       goToHome: false,
                                            //       toastDetails: ToastDetails(
                                            //         message: 'Wallpaper Applied',
                                            //         backgroundColor:
                                            //             AppColors.WHITE_COLOR,
                                            //         textColor:
                                            //             AppColors.BULE_COLOR,
                                            //       ),
                                            //       errorToastDetails:
                                            //           ToastDetails.error(),
                                            //     )
                                            //         ? 'Wallpaper set'
                                            //         : 'Failed to get wallpaper.';
                                            //   }
                                            // }
                                            print('Preview ${imageData['preview']}');
                                            var file =
                                            await DefaultCacheManager()
                                                .getSingleFile(
                                                imageData['preview']);

                                            debugPrint(file.path);
                                            result = await AsyncWallpaper
                                                .setLiveWallpaper(
                                              filePath: file.path,
                                              goToHome: false,
                                              // toastDetails: ToastDetails(
                                              //   message:
                                              //   '',
                                              //   backgroundColor:
                                              //   AppColors.WHITE_COLOR,
                                              //   textColor: AppColors.BULE_COLOR,
                                              // ),
                                              errorToastDetails:
                                              ToastDetails.error(),
                                            )
                                                ? 'Wallpaper set'
                                                : 'Failed to get wallpaper.';

                                            if (!mounted) return;

                                            setState(() {
                                              liveWallpaper = result;
                                              print('result+++ ${liveWallpaper}');
                                              print("+++wallpaper is set ");
                                            });
                                          }
                                        } on PlatformException catch (e) {
                                          debugPrint(e.toString());
                                          result = 'Failed to get wallpaper.';
                                        }

                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      } catch (e) {
                                        log(e.toString());
                                      }
                                    });

                                    // Platform messages may fail, so we use a try/catch PlatformException.
                                  },
                                  icon: const Icon(
                                      Icons.video_collection_outlined),
                                  label: const Text('Watch Ad'),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadAd() async {
    await AppOpenAd.load(
        adUnitId: "ca-app-pub-1842648639714248/5622107789",
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint("ad is loaded");
            openAd = ad;
            // openAd!.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint("ad failed to load");
          },
        ),
        orientation: AppOpenAd.orientationPortrait);
  }

  Future<int?> selectScreen() async {
    final AsyncWallpaperScreen selectedScreen = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Screen'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Home Screen'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(AsyncWallpaperScreen.HOME_SCREEN);
                    },
                  ),
                  ListTile(
                    title: const Text('Lock Screen'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(AsyncWallpaperScreen.LOCK_SCREEN);
                    },
                  ),
                  ListTile(
                    title: const Text('Both'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(AsyncWallpaperScreen.BOTH_SCREENS);
                    },
                  ),
                ],
              ),
            );
          },
        ) ??
        AsyncWallpaperScreen.NONE;
    if (selectedScreen == AsyncWallpaperScreen.BOTH_SCREENS) {
      return AsyncWallpaper.BOTH_SCREENS;
    } else if (selectedScreen == AsyncWallpaperScreen.HOME_SCREEN) {
      return AsyncWallpaper.HOME_SCREEN;
    } else if (selectedScreen == AsyncWallpaperScreen.LOCK_SCREEN) {
      return AsyncWallpaper.LOCK_SCREEN;
    } else {
      return null;
    }
  }
}

enum AsyncWallpaperScreen {
  HOME_SCREEN,
  LOCK_SCREEN,
  BOTH_SCREENS,
  NONE,
}
