import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';

@RoutePage(name: "AuthRouter")
class AuthRouterPage extends AutoRouter {
  const AuthRouterPage({super.key});
}

final AutoRoute authRoute = AutoRoute(
  page: AuthRouter.page,
  path: RoutePaths.auth,
  children: <AutoRoute>[
    AutoRoute(page: SignInRoute.page, path: RoutePaths.login),
    AutoRoute(page: SignUpRoute.page, path: RoutePaths.signup),
  ],
);
