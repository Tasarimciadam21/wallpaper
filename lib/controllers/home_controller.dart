import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/services/rest_api_service.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> oldestList = [];

  void getListOfToday() async {
    setState(true);
    todaysList = await _restApiService.convertJsonToObject(api + "&${1}");
    setState(false);
  }

  void getListOfPopular() async {
    setState(true);
    popularList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=popular");
    setState(false);
  }

  void getListOfOldest() async {
    setState(true);
    oldestList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=oldest");
    setState(false);
  }

  @override
  void onInit() {
    getListOfToday();
    getListOfPopular();
    getListOfOldest();
    super.onInit();
  }
}
