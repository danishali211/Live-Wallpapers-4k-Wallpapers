// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobServices {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1842648639714248/1834071867";

    } else if (Platform.isIOS) {
      return "cca-app-pub-1842648639714248/1834071867";
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1842648639714248/1654070474";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1842648639714248/1654070474";
    }
    return null;
  }

  static String? get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1842648639714248/4088662123";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1842648639714248/4088662123";
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) {},
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
    },
    onAdOpened: (ad) {},
    onAdClosed: (ad) {},
  );
}
