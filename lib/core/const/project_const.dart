import 'package:bloc_app/core/data/local/cache_manager.dart';
import 'package:bloc_app/core/data/local/secure_cache_manager.dart';

class ProjectConst {
  static ProjectConst? _instance;
  static ProjectConst get instance {
    if (_instance != null) return _instance!;

    _instance = ProjectConst._init();

    return _instance!;
  }

  ProjectConst._init();

  ProjectConst() {
    getConfig();
  }

  static const String apiUrl = '......';
  static Map<String, String>? headers = {};

  Future<void> getConfig() async {
    headers?['accessToken'] = CacheService.instance.getCache("accessToken");
    headers?['refreshToken'] =
        await SecureService.instance.getSecure("token") ?? "";
  }
}
