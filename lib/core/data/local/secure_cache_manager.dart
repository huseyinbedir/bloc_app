import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureService {
  static SecureService? _instance;
  static SecureService get instance {
    if (_instance != null) return _instance!;

    _instance = SecureService._init();
    return _instance!;
  }

  SecureService._init();
  final storage = const FlutterSecureStorage();

  Future<void> setSecure(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getSecure(String key) async {
    try {
      return await storage.read(key: key);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      await storage.deleteAll();
      return "";
    }
  }

  Future<void> deleteSecure(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllSecure() async {
    await storage.deleteAll();
  }
}
