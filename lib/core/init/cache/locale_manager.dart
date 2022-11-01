import 'package:cf8tpr1nt/core/constants/enums/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager get instance => _instance;

  SharedPreferences? _preferences;

  static Future<void> preferencesInstance() async {
    _instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) {
    return _preferences!.getString(key.toString()) ?? '';
  }

  Future<void> setBoolValue(PreferencesKeys key, {required bool value}) async {
    await _preferences!.setBool(key.toString(), value);
  }

  bool? getBoolValue(PreferencesKeys key) {
    return _preferences!.getBool(key.toString());
  }
}
