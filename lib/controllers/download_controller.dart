import 'package:hive/hive.dart';
import 'package:wallpaper/controllers/base_controller.dart';
import 'package:wallpaper/view/utils/constants/const.dart';

class DownloadController extends BaseController {
  Future<void> insertImagePath({String? url, String? path}) async {
    var box = await Hive.openBox<String>(downloadBox);
    box.put(url, path!);
  }
}
