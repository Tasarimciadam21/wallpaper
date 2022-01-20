import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/helpers/color_helper.dart';

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
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: pinkcolor,
                      child: WallpaperViewButton(
                          onPressed: () {},
                          color: whitecolor,
                          iconData: Icons.file_download_outlined),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WallpaperViewButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final IconData iconData;

  const WallpaperViewButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
