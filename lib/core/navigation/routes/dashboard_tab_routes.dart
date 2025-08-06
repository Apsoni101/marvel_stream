import 'package:auto_route/auto_route.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';

final List<AutoRoute> dashboardTabRoutes = <AutoRoute>[
  AutoRoute(
    page: DashboardRoute.page,
    children: <AutoRoute>[
      AutoRoute(page: HomeRoute.page, path: RoutePaths.home, initial: true),
      AutoRoute(page: ComicsRoute.page, path: RoutePaths.comics),
      AutoRoute(page: CharactersRoute.page, path: RoutePaths.characters),
      AutoRoute(page: MoreRoute.page, path: RoutePaths.more),
      AutoRoute(page: NewsRoute.page, path: RoutePaths.news),
    ],
  ),
];
