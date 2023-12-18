import 'package:bloc_app/core/data/local/cache_manager.dart';
import 'package:bloc_app/core/navigations/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _getAndroidOptions();
  _getIosOptions();
  await CacheService.instance.initPrefences();
  runApp(const MyApp());
}

storage.AndroidOptions _getAndroidOptions() =>
    const storage.AndroidOptions(encryptedSharedPreferences: true);

storage.IOSOptions _getIosOptions() => const storage.IOSOptions(
    accessibility: storage.KeychainAccessibility.unlocked_this_device);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Bloc App",
      debugShowCheckedModeBanner: false,
    );
  }
}
