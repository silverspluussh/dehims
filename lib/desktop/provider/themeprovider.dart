import 'package:flutter/foundation.dart';
import 'package:hopsysadmin/main.dart';

class Themeswitch with ChangeNotifier {
  bool _isthemeon = preferences.getBool('themeon') ?? false;

  bool get isthemeon => _isthemeon;

  switchtheme(bool theme) {
    _isthemeon = theme;
    notifyListeners();
  }

  thememaster(bool thememaster) {
    switchtheme(thememaster);
    preferences.setBool('themeon', thememaster);
    notifyListeners();
  }
}

final themestate = Themeswitch();
