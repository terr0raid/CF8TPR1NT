import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/preferences_keys.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager get instance => _instance;

  SharedPreferences? _preferences;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInstance() async {
    _instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) {
    return _preferences!.getString(key.toString()) ?? '';
  }
}
