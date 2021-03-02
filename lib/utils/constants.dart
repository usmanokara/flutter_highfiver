import 'dart:math';
import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/models/category_model.dart';

import '../models/user_model.dart';

class Constants {
  static const String Admin = "admin.highfiver@gmail.com";

  static UserModel currentUser;
  static List<CategoryModel> categoriesList = [];
  static List<AffirmationModel> affirmationsList = [];

  static String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
