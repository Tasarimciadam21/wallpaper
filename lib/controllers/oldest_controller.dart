import 'package:flutter/material.dart';
import 'package:wallpaper/controllers/base_controller.dart';

import '../models/wallpaper.dart';
import '../services/rest_api_service.dart';
import '../view/utils/constants/const.dart';

class OldestController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController oldestScrollController = ScrollController();
  List<Wallpaper> oldestList = [];

  Future<void> getListOfOldest() async {
    setState(true);
    oldestList = await _restApiService
        .convertJsonToObject(api + "&page=${1}&order_by=oldest");
    setState(false);
  }

  int oldestPageNumber = 2;

  void loadMoreData() {
    oldestScrollController.addListener(() async {
      if (oldestScrollController.position.pixels ==
          oldestScrollController.position.maxScrollExtent) {
        await addMoreDataToTodaysList();
      }
    });
  }

  Future<void> addMoreDataToTodaysList() async {
    List<Wallpaper> wallpapers = [];
    wallpapers = await _restApiService
        .convertJsonToObject(api + "&page=$oldestPageNumber&order_by=oldest");
    oldestPageNumber++;
    oldestList.addAll(wallpapers);
    update();
  }

  @override
  void onInit() {
    getListOfOldest();
    loadMoreData();
    super.onInit();
  }
}
