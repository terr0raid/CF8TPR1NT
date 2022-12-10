import 'package:cf8tpr1nt/core/constants/enums/preferences_keys.dart';
import 'package:cf8tpr1nt/core/init/cache/i_locale_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager implements ILocaleManager<PreferencesKeys> {
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

  @override
  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  @override
  String getStringValue(PreferencesKeys key) {
    return _preferences!.getString(key.toString()) ?? '';
  }

  @override
  Future<void> setBoolValue(PreferencesKeys key, {required bool value}) async {
    await _preferences!.setBool(key.toString(), value);
  }

  @override
  bool? getBoolValue(PreferencesKeys key) {
    return _preferences!.getBool(key.toString());
  }

  @override
  Future<void> clear() {
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeValue(PreferencesKeys key) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeValues(List<PreferencesKeys> keys) {
    throw UnimplementedError();
  }
}
