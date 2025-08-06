import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';

final List<AutoRoute> standaloneDashboardRoutes = <AutoRoute>[
  AutoRoute(page: MovieDetailRoute.page, path: RoutePaths.movieDetail),
  AutoRoute(page: SettingsRoute.page, path: RoutePaths.settings),
];
