// ignore_for_file: unused_element, unused_field, depend_on_referenced_packages, avoid_print

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:wallpaper/app_module/home/view/components/home_components.dart';
// import 'package:wallpaper/services/ads/ads_services.dart';
// import 'package:wallpaper/utils/theme/app_color.dart';
// import 'package:wallpaper/utils/widgets/app_button.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../services/ads/ads_services.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/app_button.dart';
import '../../home/view/components/home_components.dart';

class WallpaperView extends StatefulWidget {
  const WallpaperView({super.key});

  @override
  State<WallpaperView> createState() => _WallpaperViewState();
}

String type = '';

class _WallpaperViewState extends State<WallpaperView>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  bool isApplied = false;
  bool isDownload = true;

  String? videoUrl;

  InterstitialAd? _interstitialAdS;
  NativeAd? _nativeAd;
  BannerAd? _bannerAd;
  AnimationController? _productImageAnimationController;

  _createBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdMobServices.bannerAdUnitId!,
        listener: AdMobServices.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  _createNativeAd() {
    _nativeAd = NativeAd(
        adUnitId: AdMobServices.nativeAdUnitId!,
        factoryId: "listTile",
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            // _nativeAd = ad as NativeAd;
            setState(() {});
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            _nativeAd = null;
            setState(() {});
          },
        ),
        request: const AdRequest());
    _nativeAd!.load();
  }

  void _createInterstitialAdS() {
    InterstitialAd.load(
        adUnitId: AdMobServices.interstitialAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAdS = ad;
          },
          onAdFailedToLoad: (error) {
            _interstitialAdS = null;
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAdS != null) {
      _interstitialAdS!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _createInterstitialAdS();
        setState(() {
          isLoading = true;
        });
        if(AppImages.menuIndex == 1){
          fetchAllContact();
        } else {
          setWallpaperOther(Get.arguments['wallpaper']);
        }
        // setWallpaper(Get.arguments['wallpaper']);
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createInterstitialAdS();
      });
      _interstitialAdS!.show();
    }
  }

  @override
  void initState() {
    _productImageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      reverseDuration: const Duration(seconds: 10),
      lowerBound: 1,
      upperBound: 1.2,
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _productImageAnimationController!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _productImageAnimationController!.forward();
        }
      });
    _productImageAnimationController!.forward();
    _createBannerAd();
    _createNativeAd();
    _createInterstitialAdS();
    super.initState();
  }

  @override
  void dispose() {
    _productImageAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.GREY_COLOR,
      body: Column(children: [
        Container(
          color: AppColors.WHITE_COLOR,
          child: appBar(
            isSufix: false,
            title: AppImages.selectedCategory
          ),
        ),
        Expanded(
            child: SizedBox(
          width: Get.width,
          // color: AppColors.GREY_COLOR.withOpacity(0.5),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: AppColors.WHITE_COLOR,
                      // height: 400,
                      margin: const EdgeInsets.all(15),
                      width: Get.width,
                      child: CachedNetworkImage(
                        imageUrl: Get.arguments['thumbnail'],
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: AppColors.BULE_COLOR,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 150,
              //   width: Get.width,
              //   child: SingleChildScrollView(
              //     child: Row(
              //       children: [
              //         for (int i = 0; i < menuDetailList.length; i++)
              //           Image.asset(menuDetailList[i]["icon"])
              //       ],
              //     ),|
              //   ),
              // ),
            ],
          ),
        )),
        // _nativeAd == null
        //     ? Container()
        //     : Container(
        //         height: 200,
        //         alignment: Alignment.center,
        //         child: AdWidget(ad: _nativeAd!),
        //       ),
        _bannerAd == null
            ? Container()
            : Container(
                color: AppColors.WHITE_COLOR,
                height: 70,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 15),
                child: AdWidget(ad: _bannerAd!)),
        Container(
          width: Get.width,
          color: AppColors.WHITE_COLOR,
          padding: const EdgeInsets.all(16),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.BULE_COLOR,
                ))
              : AppButton(
                  buttonName:
                      //  isDownload
                      //     ? "Download"
                      //     :
                      isApplied ? "Applied" : "Apply",
                  buttonWidth: Get.width / 2,
                  buttonRadius: BorderRadius.circular(30),
                  buttonColor: AppColors.BULE_COLOR,
                  textColor: AppColors.WHITE_COLOR,
                  onTap: isApplied
                      ? () {}
                      : () async {
                    fetchAllContact();
                          _showInterstitialAd();
                    print("+++++++++++++++++++++");
                    print(AppImages.menuIndex);
                    if(AppImages.menuIndex == 1){
                      fetchAllContact();
                    } else {
                      setWallpaperOther(Get.arguments['wallpaper']);
                    }
                          setState(() {
                            isLoading = true;
                          });
                          // setWallpaper(Get.arguments);
                          // int location =
                          //     WallpaperManager.BOTH_SCREEN; //can be Home/Lock Screen
                          // await WallpaperManager.setWallpaperFromFile(
                          //     "assets/images/1.png", location);
                        }),
        )
      ]),
    );
  }
  Future<void> fetchAllContact() async {
    await FirebaseFirestore.instance.collection('wallpaper').doc('video').get()
        .then((value) {
        //   print("xxxxxxxxxxxx");
        // print(AppImages.detailIndex);
        setState(() {
          videoUrl = value.data()?['url'][AppImages.detailIndex]['wallpayper'];
          setWallpaper(videoUrl);
        });
      }
    );
  }
  Future<void> setWallpaper(url) async {
    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await AsyncWallpaper.setLiveWallpaper(
        filePath: file.path,
        // goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
      setState(() {
        isApplied = true;
        isLoading = false;
      });
    } on PlatformException {
      result = 'Failed to get wallpaper.';
      setState(() {
        isLoading = false;
      });
    }
  }
  Future<void> setWallpaperOther(url) async {

    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await AsyncWallpaper.setWallpaperFromFile(
        filePath: file.path,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
      setState(() {
        isApplied = true;
        isLoading = false;
      });
    } on PlatformException {
      result = 'Failed to get wallpaper.';
      setState(() {
        isLoading = false;
      });
    }
  }
}
