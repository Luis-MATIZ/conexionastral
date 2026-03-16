import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isDarkMode = false;
  static String _fecha_nacimiento = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static String get fecha_nacimiento {
    return _prefs.getString('fecha_nacimiento') ?? _fecha_nacimiento;
  }

  static set fecha_nacimiento(String fecha) {
    _fecha_nacimiento = fecha;
    _prefs.setString('fecha_nacimiento', fecha_nacimiento);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _prefs.setBool('isDarkMode', isDarkMode);
  }
}
