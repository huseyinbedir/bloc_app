import 'dart:convert';
import 'package:bloc_app/core/models/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static CacheService? _instance;
  static CacheService get instance {
    if (_instance != null) return _instance!;

    _instance = CacheService._init();
    return _instance!;
  }

  late SharedPreferences prefs;
  CacheService._init();

  Future<void> initPrefences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveCacheItem<T>(String key, T model) async {
    final stringModel = jsonEncode(model);
    return await prefs.setString(key, stringModel);
  }

  Future<bool> saveCache(String key, dynamic value) async {
    return await prefs.setString(key, value);
  }

  String getCache(String key) {
    return prefs.getString(key) ?? "";
  }

  Future<bool> setBoolCache(String key, bool value) {
    return prefs.setBool(key, value);
  }

  bool getBoolCache(String key) {
    return prefs.getBool(key) ?? false;
  }

  Future<bool> removeCacheItem<T>(String key) async {
    return await prefs.remove(key);
  }

  Future<T> getCacheItem<T extends IBaseModel>(
      String key, IBaseModel model) async {
    final cacheData = prefs.getString(key) ?? '';
    if (cacheData == '') {
      return model as T;
    }
    final otherModel = jsonDecode(cacheData);
    return model.fromString(otherModel) as T;
  }

  Future<bool> saveCacheList<T>(String key, List<T> model) async {
    final stringModel = jsonEncode(model);
    return await prefs.setString(key, stringModel);
  }

  List<T> getCacheList<T extends IBaseModel>(String key, T model) {
    final cacheData = prefs.getString(key) ?? "";
    if (cacheData.isNotEmpty) {
      return model.fromJson(cacheData) as List<T>;
    }
    return [];
  }

  Future<bool> removeAllCache() async {
    return await prefs.clear();
  }
}
