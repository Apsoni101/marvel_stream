import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/auth_guard.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';
import 'package:marvel_stream/core/navigation/routes/dashboard_tab_routes.dart';
import 'package:marvel_stream/core/navigation/routes/standalone_dashboard_routes.dart';

@RoutePage(name: "DashboardRouter")
class DashboardRouterPage extends AutoRouter {
  const DashboardRouterPage({super.key});
}

AutoRoute dashboardRoute(final AuthGuard authGuard) => AutoRoute(
  page: DashboardRouter.page,
  path: RoutePaths.dashboard,
  guards: <AutoRouteGuard>[authGuard],
  children: <AutoRoute>[...dashboardTabRoutes, ...standaloneDashboardRoutes],
);
