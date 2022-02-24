import 'package:hive/hive.dart';
import 'package:wallpaper/controllers/base_controller.dart';

import 'package:wallpaper/view/utils/constants/const.dart';

class DownloadController extends BaseController {
  Box<String>? downloadBoxListner;
  void insertImagePath({String? url, String? path}) async {
    var box = Hive.box<String>(downloadBox);
    box.put(url, path!);
  }

  @override
  void onInit() {
    downloadBoxListner = Hive.box<String>(downloadBox);
    super.onInit();
  }
}
