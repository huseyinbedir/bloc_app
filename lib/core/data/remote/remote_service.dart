import 'dart:convert';

import 'package:bloc_app/core/const/project_const.dart';
import 'package:bloc_app/core/data/local/cache_manager.dart';
import 'package:bloc_app/core/data/local/secure_cache_manager.dart';
import 'package:bloc_app/core/helpers/error_response.dart';
import 'package:http/http.dart' as http;

class AppService {
  static AppService? _instance;
  static AppService get instance {
    if (_instance != null) return _instance!;

    _instance = AppService._init();
    return _instance!;
  }

  AppService._init();

  Future<dynamic> post({required String path, required Map post}) async {
    var url = Uri.parse(ProjectConst.apiUrl + path);
    final response =
        await http.post(url, body: post, headers: ProjectConst.headers);
    return await serviceControl(response);
  }

  Future<dynamic> get({required String path}) async {
    try {
      var url = Uri.parse(ProjectConst.apiUrl + path);
      final response = await http.get(url, headers: ProjectConst.headers);
      return await serviceControl(response);
    } catch (e) {
      return FetchDataException('HATA');
    }
  }

  Future<dynamic> serviceControl(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      default:
        await CacheService.instance.removeAllCache();
        await SecureService.instance.deleteAllSecure();
        return FetchDataException("error");
    }
  }
}
