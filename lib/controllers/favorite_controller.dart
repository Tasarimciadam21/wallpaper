import 'package:hive/hive.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/models/wallpaper.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class FavoriteContoller extends BaseController {
  Box<Wallpaper>? favoriteBox;
  bool isFavorite = false;
  @override
  void onInit() {
    favoriteBox = Hive.box<Wallpaper>(favoriteBoxConst);
    super.onInit();
  }

  void insertWallaperToTheList(Wallpaper data) {
    Wallpaper wallpaper = Wallpaper(
        description: data.description,
        altDescription: data.altDescription,
        urls: data.urls);
    favoriteBox!.put(wallpaper.urls.regular, wallpaper);
  }

  void deleteWallpaperFromTheList(String key) {
    favoriteBox!.delete(key);
  }

  void inTheList(String key) {
    var value = favoriteBox!.get(key);
    if (value == null) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
    update();
  }

  void favoriteToggler(Wallpaper data) {
    isFavorite = !isFavorite;

    if (isFavorite) {
      insertWallaperToTheList(data);
    } else {
      deleteWallpaperFromTheList(data.urls.regular);
    }
    update();
  }
}
