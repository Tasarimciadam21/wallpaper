import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controllers/favorite_controller.dart';
import 'package:wallpaper/controllers/wallpaper_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/helpers/color_helper.dart';
import 'package:wallpaper/view/widgets/wallaper_widgets.dart';

class WallpaperView extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperView({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: wallpaper.urls.regular,
            child: Image.network(
              wallpaper.urls.regular,
              height: Get.height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WallpaperViewButton(
                  color: whitecolor,
                  onPressed: () {
                    Get.back();
                  },
                  iconData: Icons.arrow_back_ios,
                ),
                GetBuilder<WallpaperController>(
                  init: WallpaperController(),
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: pinkcolor,
                          child: WallpaperViewButton(
                              onPressed: () {
                                controller.downloadTheWallaper(
                                    wallpaper.urls.regular);
                              },
                              color: whitecolor,
                              iconData: Icons.file_download_outlined),
                        ),
                        SetButton(
                          wallpaper: wallpaper,
                          wallpaperController: controller,
                        ),
                        GetBuilder<FavoriteContoller>(
                          init: FavoriteContoller(),
                          initState: (con) {
                            Future.delayed(const Duration(seconds: 0))
                                .then((value) {
                              con.controller!.inTheList(wallpaper.urls.regular);
                            });
                          },
                          builder: (controller) {
                            return CircleAvatar(
                              backgroundColor: whitecolor,
                              child: WallpaperViewButton(
                                  onPressed: () {
                                    controller.favoriteToggler(wallpaper);
                                  },
                                  color: pinkcolor,
                                  iconData: controller.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                            );
                          },
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
