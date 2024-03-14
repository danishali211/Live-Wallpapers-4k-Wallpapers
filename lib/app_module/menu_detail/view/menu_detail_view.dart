// // ignore_for_file: use_build_context_synchronously

// import 'package:async_wallpaper/async_wallpaper.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:motion/motion.dart';
// import 'package:wallpaper_app/app_module/menu_detail/view/components/andrewOverview.dart';
// import 'package:wallpaper_app/main.dart';
// import 'package:wallpaper_app/services/firebase/firebase.dart';
// import 'dart:developer';
// import '../../../services/ads/ads_services.dart';
// import 'components/menu_detail_components.dart';
// // import 'package:wallpaper/app_module/home/view/components/home_components.dart';
// // import 'package:wallpaper/app_module/menu_detail/view/components/menu_detail_components.dart';
// // import 'package:wallpaper/utils/theme/app_color.dart';

// // class MenuDetailView extends StatelessWidget {
// //   const MenuDetailView({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           appBar(isBack: true, title: Get.arguments[0]),
// //
// //           // Expanded(
// //           //     child: Container(
// //           //       // color: Colors.green,
// //           //   color: AppColors.GREY_COLOR.withOpacity(0.5),
// //           //   child: detailGridView(dataList: Get.arguments[1] ?? []),
// //           // ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MenuDetailView extends StatefulWidget {
// //   @override
// //   _MenuDetailViewState createState() => _MenuDetailViewState();
// // }
// //
// // class _MenuDetailViewState extends State<MenuDetailView> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //
// //   List<dynamic> imageList = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     imageList = Get.arguments[1];
// //     debugPrint('this is list of images ${imageList}');
// //     addList(imageList);
// //     _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
// //     _pageController.addListener(_handlePageChange);
// //   }
// //
// //   void addList(List<dynamic> img) {
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     var def = img;
// //     debugPrint('this is list of images2 ${def}');
// //   }
// //
// //   void _handlePageChange() {
// //     setState(() {
// //       _currentPage = _pageController.page!.round();
// //     });
// //   }
// //
// //   double _scaleFactor(int index) {
// //     double scaleFactor = 1.0;
// //     final double difference = _currentPage - index.toDouble();
// //     scaleFactor = 1.0 - (difference.abs() * 0.2);
// //     return scaleFactor.clamp(0.8, 1.0);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${Get.arguments[0]}'),
// //       ),
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemCount: imageList.length,
// //         itemBuilder: (context, index) {
// //           final scaleFactor = _scaleFactor(index);
// //           return Center(
// //             child: Transform.scale(
// //               scale: scaleFactor,
// //               child: Card(
// //                 elevation: 5,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                 child: Container(
// //                   width: MediaQuery.of(context).size.width * 0.8,
// //                   child: Image.network(
// //                     imageList[index]['thumbnail'],
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class MenuDetailView extends StatefulWidget {
// //   @override
// //   _MenuDetailViewState createState() => _MenuDetailViewState();
// // }
// //
// // class _MenuDetailViewState extends State<MenuDetailView> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //
// //   List<dynamic> imageList = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     imageList = Get.arguments[1];
// //     debugPrint('this is list of images ${imageList}');
// //     addList(imageList);
// //     _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
// //     _pageController.addListener(_handlePageChange);
// //   }
// //
// //   void addList(List<dynamic> img) {
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     var def = img;
// //     debugPrint('this is list of images2 ${def}');
// //   }
// //
// //   void _handlePageChange() {
// //     setState(() {
// //       _currentPage = _pageController.page?.round() ?? 0;
// //     });
// //   }
// //
// //   double _scaleFactor(int index) {
// //     double scaleFactor = 1.0;
// //     final double difference = _currentPage - index.toDouble();
// //     scaleFactor = 1.0 - (difference.abs() * 0.2);
// //     return scaleFactor.clamp(0.8, 1.0);
// //   }
// //
// //   double _cardScale(int index) {
// //     final double scaleFactor = _scaleFactor(index);
// //     return scaleFactor.clamp(0.8, 1.0);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${Get.arguments[0]}'),
// //       ),
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemCount: imageList.length,
// //         itemBuilder: (context, index) {
// //           return Center(
// //             child: OpenContainer(
// //               transitionType: ContainerTransitionType.fade,
// //               closedBuilder: (BuildContext _, VoidCallback openContainer) {
// //                 return AnimatedBuilder(
// //                   animation: _pageController,
// //                   builder: (context, child) {
// //                     final double scale = _cardScale(index);
// //                     return Transform.scale(
// //                       scale: scale,
// //                       child: Card(
// //                         elevation: 5,
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                         child: InkWell(
// //                           onTap: openContainer,
// //                           child: Container(
// //                             width: MediaQuery.of(context).size.width * 0.8,
// //                             child: Image.network(
// //                               imageList[index]['thumbnail'],
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //               openBuilder: (BuildContext _, VoidCallback closeContainer) {
// //                 return Scaffold(
// //                   appBar: AppBar(
// //                     title: Text('Image Detail'),
// //                   ),
// //                   body: Center(
// //                     child: Card(
// //                       elevation: 5,
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                       child: Container(
// //                         // color: Colors.green,
// //                         width: MediaQuery.of(context).size.width * 0.8,
// //                         child: Image.network(
// //                           imageList[index]['thumbnail'],
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //

// // class MenuDetailView extends StatefulWidget {
// //   @override
// //   _MenuDetailViewState createState() => _MenuDetailViewState();
// // }
// //
// // class _MenuDetailViewState extends State<MenuDetailView> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //
// //   List<dynamic> imageList = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     imageList = Get.arguments[1];
// //     debugPrint('this is list of images ${imageList}');
// //     addList(imageList);
// //     _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
// //     _pageController.addListener(_handlePageChange);
// //   }
// //

// //
// //   void _handlePageChange() {
// //     setState(() {
// //       _currentPage = _pageController.page?.round() ?? 0;
// //     });
// //   }
// //
// //   double _scaleFactor(int index) {
// //     double scaleFactor = 1.0;
// //     final double difference = _currentPage - index.toDouble();
// //     scaleFactor = 1.0 - (difference.abs() * 0.2);
// //     return scaleFactor.clamp(0.8, 1.0);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${Get.arguments[0]}'),
// //       ),
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemCount: imageList.length,
// //         itemBuilder: (context, index) {
// //           double scaleFactor = _scaleFactor(index);
// //           return Center(
// //             child: Card(
// //               elevation: 5,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //               child: AnimatedContainer(
// //                 duration: Duration(milliseconds: 300),
// //                 width: MediaQuery.of(context).size.width * (0.8 * scaleFactor),
// //                 // height: MediaQuery.of(context).size.width * (0.8 * scaleFactor),
// //                 child: Image.network(
// //                   imageList[index]['thumbnail'],
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // ------------------------------------------//
// // class MenuDetailView extends StatefulWidget {
// //   @override
// //   _MenuDetailViewState createState() => _MenuDetailViewState();
// // }
// //
// // class _MenuDetailViewState extends State<MenuDetailView> {
// //   late PageController _pageController;
// //   int _currentPage = 0;
// //
// //   List<dynamic> imageList = [];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     imageList = Get.arguments[1];
// //     debugPrint('this is list of images ${imageList}');
// //     addList(imageList);
// //     _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8);
// //     _pageController.addListener(_handlePageChange);
// //   }
// //   void addList(List<dynamic> img) {
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     img.add({
// //       "thumbnail":
// //       "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/png%2F1.png?alt=media&token=14ab082a-26dc-461f-96a5-b26c34ae95b9&_gl=1*jzqluh*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODE1OTkwOC45LjEuMTY5ODE2MDc0Mi42MC4wLjA.",
// //     });
// //     var def = img;
// //     debugPrint('this is list of images2 ${def}');
// //   }
// //   void _handlePageChange() {
// //     setState(() {
// //       _currentPage = _pageController.page?.round() ?? 0;
// //     });
// //   }
// //
// //   double _scaleFactor(int index) {
// //     double scaleFactor = 1.0;
// //     final double difference = _currentPage - index.toDouble();
// //     scaleFactor = 1.0 - (difference.abs() * 0.2);
// //     return scaleFactor.clamp(0.8, 1.0);
// //   }
// //
// //   void _selectImage(int index) {
// //     _pageController.animateToPage(
// //       index,
// //       duration: Duration(milliseconds: 300),
// //       curve: Curves.easeInOut,
// //     );
// //     debugPrint('this is indexx ${index}');
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${Get.arguments[0]}'),
// //       ),
// //       body: PageView.builder(
// //         controller: _pageController,
// //         itemCount: imageList.length,
// //         onPageChanged: (index) {
// //           _handlePageChange();
// //         },
// //         itemBuilder: (context, index) {
// //           double scaleFactor = _scaleFactor(index);
// //           return Center(
// //             child: Card(
// //               elevation: 5,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //               child: InkWell(
// //                 onTap: () {
// //                   _selectImage(index);
// //                 },
// //                 child: AnimatedContainer(
// //                   duration: Duration(milliseconds: 300),
// //                   width: MediaQuery.of(context).size.width * (0.8 * scaleFactor),
// //                   child: Image.network(
// //                     imageList[index]['thumbnail'],
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// class MenuDetailView extends StatefulWidget {
//   const MenuDetailView({super.key});

//   @override
//   _MenuDetailViewState createState() => _MenuDetailViewState();
// }

// class _MenuDetailViewState extends State<MenuDetailView> {
//   late PageController _pageController;
//   BannerAd? _bannerAd;
//   bool isBannerAdReady = false;
//   int _currentPage = 0;
//   int? newIndes;
//   List<dynamic> _source = [];
//   int? _currentImageIndex;
//   String _liveWallpaper = 'Unknown';
//   int? indexValue;
//   @override
//   void initState() {
//     super.initState();
//     // createBottomBannerAd();
//     _source = Get.arguments[1];
//     indexValue = Get.arguments[2];
//     // addList(_source);
//     log('this is image list $_source');
//     loadAd();
//     _pageController =
//         PageController(initialPage: _currentPage, viewportFraction: 0.8);
//     _pageController.addListener(_handlePageChange);
//   }

//   Future<void> loadAd() async {
//     await AppOpenAd.load(
//         adUnitId: "ca-app-pub-1842648639714248/5622107789",
//         request: const AdRequest(),
//         adLoadCallback: AppOpenAdLoadCallback(
//           onAdLoaded: (ad) {
//             debugPrint("ad is loaded");
//             openAd = ad;
//             // openAd!.show();
//           },
//           onAdFailedToLoad: (error) {
//             debugPrint("ad failed to load");
//           },
//         ),
//         orientation: AppOpenAd.orientationPortrait);
//   }

//   createBottomBannerAd() {
//     try {
//       if (AdMobServices.bannerAdUnitId != null) {
//         MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
//             testDeviceIds: ['A3ACF3DD60452013000CFAAC74B614B8']));
//         _bannerAd = BannerAd(
//           adUnitId: AdMobServices.bannerAdUnitId!,
//           size: AdSize.banner,
//           request: const AdRequest(),
//           listener: BannerAdListener(
//             onAdLoaded: (_) {
//               if (mounted) {
//                 setState(() {
//                   isBannerAdReady = true;
//                 });
//               }
//             },
//             onAdFailedToLoad: (ad, error) {
//               debugPrint('this is add error $error');
//               ad.dispose();
//             },
//           ),
//         );
//         _bannerAd!.load();
//       }
//     } catch (e) {
//       _bannerAd = null;
//     }
//   }

//   void addList(List<dynamic> img) {
//     img.add({
//       "thumbnail":
//           "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/gif%2F9thumbnail.gif?alt=media&token=d29e444b-01c0-430f-91eb-6596e55199cc&_gl=1*108y1fe*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODIzOTQ3My4xNC4xLjE2OTgyNDI5NjAuNDguMC4w",
//     });
//     img.add({
//       "thumbnail":
//           "https://firebasestorage.googleapis.com/v0/b/wallpapers-app-3dd74.appspot.com/o/gif%2F8thumbnail.gif?alt=media&token=9c5688fd-338c-480e-9af3-76cc36c07484&_gl=1*2cw1v4*_ga*NTA2MzY4NDM4LjE2ODQwODA5NzQ.*_ga_CW55HF8NVT*MTY5ODIzOTQ3My4xNC4xLjE2OTgyNDI5MjUuMjMuMC4w",
//     });
//     var def = img;
//     debugPrint('this is list of images2 $def');
//   }

//   void _handlePageChange() {
//     setState(() {
//       _currentPage = _pageController.page?.round() ?? 0;
//       _selectMiddleImage();
//     });
//   }

//   void _selectMiddleImage() {
//     int middleIndex = _currentPage;
//     _showImage(middleIndex);
//   }

//   void _showImage(int Middleindex) async {
//     await Future.delayed(const Duration(milliseconds: 2000));
//     setState(() {
//       newIndes = Middleindex;
//     });
//     // Here you can implement logic to determine the image to be shown at the given index.
//     // For example, if you want to show a different image, you can update the imageList.
//     // For demonstration purposes, I'll just debugPrint the image URL.
//     debugPrint('Showing image at index $Middleindex:');
//     int Newindex =
//         _source.indexWhere((item) => item.containsValue(Middleindex));
//     debugPrint('this is new index $Newindex');
//   }

//   double _scaleFactor(int index) {
//     double scaleFactor = 1.0;
//     final double difference = _currentPage - index.toDouble();
//     scaleFactor = 1.0 - (difference.abs() * 0.2);
//     return scaleFactor.clamp(0.8, 1.0);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     if (_bannerAd != null) {
//       _bannerAd!.dispose();
//     }
//     newIndes = null;
//     super.dispose();
//   }

//   var title;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     title = Get.arguments[0] ?? title;
//     if (Motion.instance.isPermissionRequired &&
//         !Motion.instance.isPermissionGranted) {
//       showPermissionRequestDialog(
//         context,
//         onDone: () {
//           setState(() {});
//         },
//       );
//     }
//     return PopScope(
//       canPop: true,
//       onPopInvoked: (didPop) async {
//         await getAllUserData(onChange: (onChange) {
//           Get.offNamed("/home", arguments: onChange);
//         });
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () async {
//               await getAllUserData(onChange: (onChange) {
//                 Get.offNamed("/home", arguments: onChange);
//               });
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//             ),
//           ),
//           title: Text('${title ?? ''}'),
//         ),
//         body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 400,
//               aspectRatio: 16 / 9,
//               viewportFraction: 0.8,
//               initialPage: 0,
//               enableInfiniteScroll: false,
//               reverse: false,
//               // autoPlay: true,
//               animateToClosest: true,
//               pauseAutoPlayOnTouch: true,
//               autoPlayInterval: const Duration(seconds: 3),
//               autoPlayAnimationDuration: const Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enlargeCenterPage: true,
//               enlargeFactor: 0.3,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentImageIndex = index;
//                 });
//                 debugPrint('currentImageindex $_currentImageIndex');
//               },
//               scrollDirection: Axis.horizontal,
//             ),
//             items: _source.map((imageUrl) {
//               debugPrint('this is image url $imageUrl');
//               return Builder(builder: (BuildContext context) {
//                 return Stack(
//                   children: [
//                     Motion.elevated(
//                       elevation: 85,
//                       child: Container(
//                         clipBehavior: Clip.hardEdge,
//                         height: double.maxFinite,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 10,
//                               spreadRadius: 3,
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: CachedNetworkImage(
//                           imageUrl: imageUrl['wallpaper'],
//                           fit: BoxFit.cover,
//                           placeholder: (context, url) => Center(
//                             child: CachedNetworkImage(
//                               imageUrl: imageUrl['thumbnail'],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           errorWidget: (context, url, error) => Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [const Icon(Icons.error), Text('$error')],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               });
//             }).toList(),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           isBannerAdReady && _bannerAd != null
//               ? Container(
//                   height: height * 0.17, child: AdWidget(ad: _bannerAd!))
//               : Container(
//                   // height: height * 0.27,
//                   alignment: Alignment.center,
//                   // color: Colors.black,
//                   // margin:  EdgeInsets.only(bottom: 15),
//                 ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             // height: height * 0.08,
//             width: width,
//             // color: Colors.green,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _liveWallpaper == 'Loading'
//                         ? const CircularProgressIndicator(
//                             color: Colors.blue,
//                           )
//                         : CustomButton(
//                             title: 'Apply',
//                             color1: Colors.blue,
//                             textcolor: Colors.white,
//                             onTap: () async {
//                               bool loading = false;
//                               await loadAd();
//                               showAdaptiveDialog(
//                                 context: context,
//                                 barrierDismissible: false,
//                                 builder: (context) => StatefulBuilder(
//                                   builder: (context, setState) =>
//                                       AlertDialog.adaptive(
//                                     title: const Text('Apply Wallpaper'),
//                                     content: const Text(
//                                         'Watch Ad to Apply wallpaper'),
//                                     actionsAlignment: MainAxisAlignment.center,
//                                     actions: [
//                                       loading
//                                           ? const CircularProgressIndicator()
//                                           : OutlinedButton.icon(
//                                               onPressed: () async {
//                                                 String result;
//                                                 setState(() {
//                                                   loading = true;
//                                                 });
//                                                 try {
//                                                   await openAd?.show();

//                                                   try {
//                                                     if (indexValue == 1) {
//                                                       var file = await DefaultCacheManager()
//                                                           .getSingleFile(_source[
//                                                               _currentImageIndex ??
//                                                                   0]['preview']);

//                                                       debugPrint(file.path);
//                                                       result = await AsyncWallpaper
//                                                               .setLiveWallpaper(
//                                                         filePath: file.path,
//                                                         goToHome: false,
//                                                         toastDetails:
//                                                             ToastDetails
//                                                                 .success(),
//                                                         errorToastDetails:
//                                                             ToastDetails
//                                                                 .error(),
//                                                       )
//                                                           ? 'Wallpaper set'
//                                                           : 'Failed to get wallpaper.';

//                                                       if (!mounted) return;

//                                                       setState(() {
//                                                         _liveWallpaper = result;
//                                                       });
//                                                     } else {
//                                                       _liveWallpaper = '';
//                                                       Get.toNamed(
//                                                           '/setWallpaper',
//                                                           arguments: {
//                                                             'imageUrl': _source[
//                                                                 _currentImageIndex ??
//                                                                     0]['thumbnail']
//                                                           });
//                                                     }

//                                                     await loadAd();
//                                                   } on PlatformException catch (e) {
//                                                     debugPrint(e.toString());
//                                                     result =
//                                                         'Failed to get wallpaper.';
//                                                   }

//                                                   Navigator.pop(context);
//                                                 } catch (e) {
//                                                   log(e.toString());
//                                                 }
//                                                 await loadAd();

//                                                 // Platform messages may fail, so we use a try/catch PlatformException.
//                                               },
//                                               icon: const Icon(Icons
//                                                   .video_collection_outlined),
//                                               label: const Text('Watch Ad'),
//                                             )
//                                     ],
//                                   ),
//                                 ),
//                               );

//                               // Get.toNamed('/setWallpaper', arguments: {
//                               //   'imageUrl': _source[_currentImageIndex ?? 0]
//                               //       ['thumbnail']
//                               // });
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) => AndrewOverview(
//                               //       imageUrl: _source[_currentImageIndex!]['thumbnail'],
//                               //     ),
//                               //   ),
//                               // );
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   Future<void> showPermissionRequestDialog(BuildContext context,
//       {required Function() onDone}) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('Permission required'),
//         content: const Text(
//             'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'Cancel'),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Motion.instance.requestPermission();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//   // List<dynamic> _source = [Colors.amber, Colors.black, Colors.purple];
//   // Widget build(BuildContext context) {
//   //   var width = MediaQuery.of(context).size.width;
//   //   var height = MediaQuery.of(context).size.height;
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('${Get.arguments[0]}'),
//   //     ),
//   //     body: Column(
//   //       mainAxisAlignment: MainAxisAlignment.start,
//   //       children: [
//   //         Expanded(
//   //           child: Container(
//   //             height: height * 0.50,
//   //             child: PageView.builder(
//   //               controller: _pageController,
//   //               itemCount: imageList.length,
//   //               itemBuilder: (context, index) {
//   //                 double scaleFactor = _scaleFactor(index);
//   //                 return Card(
//   //                   elevation: 5,
//   //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   //                   child: AnimatedContainer(
//   //                     duration: Duration(milliseconds: 300),
//   //                     width: MediaQuery.of(context).size.width * (0.8 * scaleFactor) *0.8,
//   //                     child: Image.network(
//   //                       imageList[index]['thumbnail'],
//   //                       // NewIndes == null?
//   //                       // imageList[index]['thumbnail'] : imageList[NewIndes!]['wallpaper'],
//   //                       fit: BoxFit.cover,
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //           ),
//   //         ),
//   //         isBannerAdReady && _bannerAd != null
//   //             ? Container(
//   //           height: height * 0.17,
//   //             child: AdWidget(ad: _bannerAd!)
//   //         ) :Container(
//   //             // height: height * 0.27,
//   //             alignment: Alignment.center,
//   //             // color: Colors.black,
//   //             // margin:  EdgeInsets.only(bottom: 15),
//   //           child: CircularProgressIndicator(
//   //             backgroundColor: Colors.blue,
//   //           ),
//   //            ),
//   //         SizedBox(
//   //           height: height * 0.02,
//   //         ),
//   //         Container(
//   //           // height: height * 0.08,
//   //           width: width,
//   //           // color: Colors.green,
//   //           child: Padding(
//   //             padding: const EdgeInsets.symmetric(horizontal: 20),
//   //             child: Row(
//   //               children: [
//   //                 Expanded(child: CustomButton(title: 'Apply', color1:Colors.blue,
//   //                   textcolor: Colors.white,
//   //                   onTap: (){
//   //
//   //                   },
//   //                 )),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
