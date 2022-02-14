import 'package:flutter/cupertino.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/services/rest_api_service.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  final ScrollController todaysScrollController = ScrollController();
  final ScrollController popularScrollController = ScrollController();
  final ScrollController oldestScrollController = ScrollController();

  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> oldestList = [];
  int todaysPageNumber = 2;
  Future<void> getListOfToday() async {
    todaysList = await _restApiService.convertJsonToObject(api + "&page=${1}");
  }

  Future<void> getListOfPopular() async {
    popularList = await _restApiService
        .convertJsonToObject(api + "&page=${1}&order_by=popular");
  }

  Future<void> getListOfOldest() async {
    oldestList = await _restApiService
        .convertJsonToObject(api + "&page=${1}&order_by=oldest");
  }

  void loadMoreData() {
    todaysScrollController.addListener(() async {
      if (todaysScrollController.position.pixels ==
          todaysScrollController.position.maxScrollExtent) {
        print("okay");
        await addMoreDataToTodaysList();
      }
    });
  }

  Future<void> addMoreDataToTodaysList() async {
    List<Wallpaper> wallpapers = [];
    wallpapers = await _restApiService
        .convertJsonToObject(api + "&page=$todaysPageNumber");
    todaysPageNumber++;
    todaysList.addAll(wallpapers);
    update();
  }

  void getllData() async {
    setState(true);
    await getListOfToday();
    await getListOfPopular();
    await getListOfOldest();
    setState(false);
  }

  @override
  void onInit() {
    getllData();
    loadMoreData();
    super.onInit();
  }
}
