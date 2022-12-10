abstract class ILocaleManager<T> {
  Future<void> init();
  Future<void> clear();
  Future<void> setStringValue(T key, String value);
  Future<void> setBoolValue(T key, {required bool value});
  String? getStringValue(T key);
  bool? getBoolValue(T key);
  Future<void> removeValue(T key);
  Future<void> removeValues(List<T> keys);
}
