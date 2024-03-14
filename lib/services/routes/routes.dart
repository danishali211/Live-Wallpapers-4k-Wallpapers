import 'package:get/get.dart';
import 'package:wallpaper_app/app_module/menu_detail/view/components/andrewOverview.dart';

import '../../app_module/home/view/home_view.dart';
import '../../app_module/menu_detail/view/menu_detail_view.dart';
import '../../app_module/privacy/view/privacy_view.dart';
import '../../app_module/splash/view/splash_view.dart';
import '../../app_module/wallpaper_detail/view/wallppper_detail_view.dart';
// import 'package:wallpaper/app_module/home/view/home_view.dart';
// import 'package:wallpaper/app_module/menu_detail/view/menu_detail_view.dart';
// import 'package:wallpaper/app_module/privacy/view/privacy_view.dart';
// import 'package:wallpaper/app_module/splash/view/splash_view.dart';
// import 'package:wallpaper/app_module/wallpaper_detail/view/wallppper_detail_view.dart';

class MyRoutes {
  static final myroutes = [
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
    ),
    // GetPage(
    //   name: '/menu_detail',
    //   page: () =>  MenuDetailView(),
    // ),
    GetPage(
      name: '/wallpaper_detail',
      page: () => const WallpaperView(),
    ),
    GetPage(
      name: '/privacy',
      page: () => const PrivacyView(),
    ),
    // GetPage(
    //   name: '/setWallpaper',
    //   arguments: imageUrl,
    //   page: () =>  AndrewOverview(),
    // ),
  ];
}
