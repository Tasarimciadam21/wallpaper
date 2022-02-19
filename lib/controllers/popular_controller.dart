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
}
