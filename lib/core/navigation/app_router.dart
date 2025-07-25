import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, path: RoutePaths.splash, initial: true),
    AutoRoute(page: OnboardingRoute.page, path: RoutePaths.onBoardingScreen),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SignInRoute.page),
  ];
}
