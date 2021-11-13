import 'package:flutter/foundation.dart';

class ListTheme with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isDark = false;

  bool get isDark => _isDark;

  void change() {
    _isDark = _isDark==true? false : true;
    notifyListeners();
  }

}