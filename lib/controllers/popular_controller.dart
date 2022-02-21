import 'package:flutter/material.dart';
import 'package:wallpaper/controllers/base_controller.dart';

import '../models/wallpaper.dart';
import '../services/rest_api_service.dart';
import '../view/utils/constants/const.dart';

class PopularController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController popularScrollController = ScrollController();
  List<Wallpaper> popularList = [];

  Future<void> getListOfPopular() async {
    setState(true);
    popularList = await _restApiService
        .convertJsonToObject(api + "&page=${1}&order_by=popular");
    setState(false);
  }

  int popularPageNumber = 2;

  void loadMoreData() {
    popularScrollController.addListener(() async {
      if (popularScrollController.position.pixels ==
          popularScrollController.position.maxScrollExtent) {
        await addMoreDataToTodaysList();
      }
    });
  }

  Future<void> addMoreDataToTodaysList() async {
    setBottomState(true);
    List<Wallpaper> wallpapers = [];
    wallpapers = await _restApiService
        .convertJsonToObject(api + "&page=$popularPageNumber&order_by=popular");
    popularPageNumber++;
    popularList.addAll(wallpapers);
    setBottomState(false);
  }

  @override
  void onInit() {
    getListOfPopular();
    loadMoreData();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   popularScrollController.dispose();
  //   super.onClose();
  // }
}
