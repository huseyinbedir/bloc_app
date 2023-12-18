import 'package:bloc_app/core/data/local/cache_manager.dart';
import 'package:bloc_app/core/data/local/secure_cache_manager.dart';
import 'package:bloc_app/core/data/remote/remote_service.dart';
import 'package:bloc_app/core/helpers/error_response.dart';
import 'package:bloc_app/core/models/response_model.dart';
import 'package:bloc_app/features/splash/model/token_model.dart';

class SplashService {
  Future<T> controlUser<T, K>() async {
    String? token = await SecureService.instance.getSecure("token");
    if (token == "") {
      return ResponseModel(status: "danger", description: "Kullanıcı Yok") as T;
    }
    final getUser = await AppService.instance.get(path: "token/refreshToken");
    if (getUser is AppException) {
      return getUser.response as T;
    }
    TokenModel userToken = TokenModel.fromJson(getUser['data']);
    CacheService.instance.saveCacheItem("userToken", userToken);
    CacheService.instance.saveCache("accessToken", userToken.token);
    SecureService.instance.setSecure("token", userToken.refreshToken!);

    return userToken as T;
  }
}
