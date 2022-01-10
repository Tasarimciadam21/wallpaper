import 'package:flutter/material.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/helpers/color_helper.dart';

class SharedGridWidget extends StatelessWidget {
  final List<Wallpaper> wallpapers;
  const SharedGridWidget({Key? key, required this.wallpapers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 2 / 2.7,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: pinkcolor,
                  ),
                  child: Image.network(
                    wallpapers[index].urls.small,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
    );
  }
}
