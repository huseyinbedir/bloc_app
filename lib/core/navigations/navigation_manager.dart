import 'package:bloc_app/core/data/local/secure_cache_manager.dart';
import 'package:bloc_app/core/navigations/router_const.dart';
import 'package:bloc_app/features/home/view/home_page.dart';
import 'package:bloc_app/features/login/view/login_page.dart';
import 'package:bloc_app/features/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    redirect: (context, GoRouterState state) async {
      String? token = await SecureService.instance.getSecure("token");
      bool isAuthenticated = token == null ? false : true;
      if (!isAuthenticated) {
        return '/login';
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: RouterConst.splashPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouterConst.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouterConst.home,
        builder: (context, state) => const HomePage(),
      )
    ]);
