import 'dart:developer';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MenuDetailController extends GetxController {
  var listOfWallpaper = [].obs;
  var listOfLiveWallpaper = [].obs;
  InterstitialAd? _interstitialAd;

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-1842648639714248/1654070474',
      // test add id down
      // adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          log('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd == null) {
      log('InterstitialAd is not ready yet.');
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        log('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        loadInterstitialAd(); // Load the next interstitial ad
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        loadInterstitialAd(); // Load the next interstitial ad
      },
    );

    _interstitialAd!.show();
  }

  RewardedAd? rewardedAd;
  loadRewardAd() async {
    RewardedAd.load(
      adUnitId: "ca-app-pub-1842648639714248/7031354389",
      // test ad id down
      // adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => rewardedAd = ad,
        onAdFailedToLoad: (error) => log(error.message),
      ),
    );
  }

  showRewardAd(
    BuildContext context, {
    required VoidCallback onAdRewared,
    // required Function(AdWithoutView, RewardItem) onUserEarnedReward,
  }) async {
    if (rewardedAd == null) {
      return;
    } else {
      rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {},
      );

      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          onAdRewared();
          ad.dispose();
          // Navigator.pop(context);
        },
        onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
      );
    }
    await loadRewardAd();
  }
}
