import 'package:flutter/cupertino.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/services/rest_api_service.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController todaysScrollController = ScrollController();
  List<Wallpaper> todaysList = [];

  int todaysPageNumber = 2;

  Future<void> getListOfToday() async {
    setState(true);
    todaysList = await _restApiService.convertJsonToObject(api + "&page=${1}");
    setState(false);
  }

  void loadMoreData() {
    todaysScrollController.addListener(() async {
      if (todaysScrollController.position.pixels ==
          todaysScrollController.position.maxScrollExtent) {
        await addMoreDataToTodaysList();
      }
    });
  }

  Future<void> addMoreDataToTodaysList() async {
    setBottomState(true);
    List<Wallpaper> wallpapers = [];
    wallpapers = await _restApiService
        .convertJsonToObject(api + "&page=$todaysPageNumber");
    todaysPageNumber++;
    todaysList.addAll(wallpapers);
    setBottomState(false);
  }

  @override
  void onInit() {
    getListOfToday();
    loadMoreData();
    super.onInit();
  }
}
