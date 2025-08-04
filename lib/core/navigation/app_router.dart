import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/auth_guard.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';
import 'package:marvel_stream/core/navigation/router/auth_router.dart';
import 'package:marvel_stream/core/navigation/router/dashboard_router.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard = AppInjector.getIt<AuthGuard>();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, path: RoutePaths.splash, initial: true),
    AutoRoute(page: ProfileRoute.page),
    authRoute,
    dashboardRoute(authGuard),
  ];
}
