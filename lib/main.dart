// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:wallpaper/services/Network/BindingNetwork/binding_network.dart';
// import 'package:wallpaper/services/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallpaper_app/services/Network/BindingNetwork/binding_network.dart';
import 'package:wallpaper_app/services/routes/routes.dart';
import 'package:motion/motion.dart';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: "ca-app-pub-1842648639714248/5622107789",
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print("ad is loaded");
          openAd = ad;
          openAd!.show();
        },
        onAdFailedToLoad: (error) {
          print("ad failed to load");
        },
      ),
      orientation: AppOpenAd.orientationPortrait);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Motion.instance.requestPermission();

  /// Initialize the plugin to determine gyroscope availability.
  await Motion.instance.initialize();

  /// Globally set Motion's update interval to 60 frames per second.
  Motion.instance.setUpdateInterval(60.fps);
  await loadAd();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print("+++ starting app ");
    return GetMaterialApp(
        title: '3D HB Wallpaper',
        debugShowCheckedModeBanner: false,
        initialBinding: BindingNetwork(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        getPages: MyRoutes.myroutes);
  }
}
