import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/auth_guard.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';

@RoutePage(name: "DashboardRouter")
class DashboardRouterPage extends AutoRouter {
  const DashboardRouterPage({super.key});
}

AutoRoute dashboardRoute(final AuthGuard authGuard) => AutoRoute(
  page: DashboardRouter.page,
  path: RoutePaths.dashboard,
  guards: <AutoRouteGuard>[authGuard],
  children: <AutoRoute>[
    AutoRoute(
      page: DashboardRoute.page,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(page: HomeRoute.page, path: RoutePaths.home, initial: true),
        AutoRoute(page: CategoriesRoute.page, path: RoutePaths.categories),
        AutoRoute(page: DownloadsRoute.page, path: RoutePaths.downloads),
        AutoRoute(page: MoreRoute.page, path: RoutePaths.more),
      ],
    ),
    AutoRoute(page: MovieDetailRoute.page,path:RoutePaths.movieDetail),
  ],
);
