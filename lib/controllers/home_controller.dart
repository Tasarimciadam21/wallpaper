import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/services/rest_api_service.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class HomeController extends BaseController {
  final RestApiService _restApiService = RestApiService();
  List<Wallpaper> todaysList = [];
  List<Wallpaper> popularList = [];
  List<Wallpaper> oldestList = [];

  Future<void> getListOfToday() async {
    todaysList = await _restApiService.convertJsonToObject(api + "&${1}");
  }

  Future<void> getListOfPopular() async {
    popularList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=popular");
  }

  Future<void> getListOfOldest() async {
    oldestList = await _restApiService
        .convertJsonToObject(api + "&${1}&order_by=oldest");
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
    super.onInit();
  }
}
