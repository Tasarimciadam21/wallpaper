import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controllers/home_controller.dart';
import 'package:wallpaper/view/utils/helpers/color_helper.dart';
import 'package:wallpaper/view/utils/helpers/style_helper.dart';
import 'package:wallpaper/view/utils/shared/shared_grid_widget.dart';

import '../../controllers/oldest_controller.dart';
import '../../controllers/popular_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wallpaper",
            style: h1,
          ),
          centerTitle: true,
          backgroundColor: whitecolor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: greyColor,
              ),
            ),
          ],
          bottom: const TabBar(
              indicatorColor: Colors.transparent,
              labelColor: pinkcolor,
              unselectedLabelColor: greyColor,
              tabs: [
                Text(
                  "TODAY",
                  style: links,
                ),
                Text(
                  "POPULAR",
                  style: links,
                ),
                Text(
                  "OLDEST",
                  style: links,
                ),
              ]),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.todaysList,
                        scrollController: controller.todaysScrollController,
                        isLoading: controller.bottomstate,
                      );
              },
            ),
            GetBuilder<PopularController>(
              init: PopularController(),
              builder: (controller) {
                return controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.popularList,
                        scrollController: controller.popularScrollController,
                        isLoading: controller.bottomstate,
                      );
              },
            ),
            GetBuilder<OldestController>(
              init: OldestController(),
              builder: (controller) {
                return controller.state
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SharedGridWidget(
                        wallpapers: controller.oldestList,
                        scrollController: controller.oldestScrollController,
                        isLoading: controller.bottomstate,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
