import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallpaper/models/urls.dart';
import 'package:wallpaper/view/screens/base_view.dart';

import 'package:wallpaper/view/screens/homeview.dart';
import 'package:wallpaper/view/utils/constants/const.dart';
import 'models/wallpaper.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(WallpaperAdapter());
  await Hive.openBox<Wallpaper>(favoriteBoxConst);
  await Hive.openBox<String>(downloadBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseView(),
    );
  }
}
