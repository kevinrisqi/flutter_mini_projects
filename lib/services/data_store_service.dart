import 'package:flutter_mini_projects/properties/constant.dart';
import 'package:flutter_mini_projects/services/base.dart';
import 'package:hive/hive.dart';

class DataStoreService {
  static var prefBox = Hive.box(hivePref);

  static Future<void> setPermissionContact({bool value = false}) async {
    await prefBox.put('hasPermissionContact', value);
  }

  static Future<bool> get hasPermissionContact async {
    return prefBox.get('hasPermissionContact');
  }
}
