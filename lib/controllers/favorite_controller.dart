import 'package:hive/hive.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class FavoriteContoller extends BaseController {
  Box<Wallpaper>? favoriteBox;
  @override
  void onInit() {
    favoriteBox = Hive.box<Wallpaper>(favoriteBoxConst);
    super.onInit();
  }
}
