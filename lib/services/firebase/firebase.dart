// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

getAllUserData({required Function onChange}) async {
  // isLoading(true);
  print("xxxxxxxxxxxxx1");
  await FirebaseFirestore.instance.collection('wallpaper').get().then((value) {
    log("xxxxxxxxxxxxx${value.docs}");
    // print(value.docs.last.id);
    onChange(value.docs);
  });

  // isLoading(false);
  // try {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('wallpaper').get();
  //
  //   // Access documents and data here
  //   List<QueryDocumentSnapshot> documents = querySnapshot.docs;
  //
  //   for (var document in documents) {
  //     // Access data for each document
  //     var wallpaperData = document.data();
  //     print(wallpaperData);
  //   }
  // } catch (e) {
  //   print('Error fetching data: $e');
  //   // Handle the error accordingly
  // }
}
