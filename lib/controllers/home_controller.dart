import 'package:get/get.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/services/rest_api_service.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];

  void getListOfToday() async {
    setState(true);
    todaysList = await _restApiService.convertJsonToObject(1);
    setState(false);
  }

  @override
  void onInit() {
    getListOfToday();
    super.onInit();
  }
}
