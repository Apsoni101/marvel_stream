// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i15;
import 'package:marvel_stream/core/navigation/router/auth_router.dart' as _i1;
import 'package:marvel_stream/core/navigation/router/dashboard_router.dart'
    as _i3;
import 'package:marvel_stream/feature/auth/presentation/screens/sign_in_screen.dart'
    as _i10;
import 'package:marvel_stream/feature/auth/presentation/screens/sign_up_screen.dart'
    as _i11;
import 'package:marvel_stream/feature/categories/presentation/screens/categories_screen.dart'
    as _i2;
import 'package:marvel_stream/feature/common/presentation/screens/dashboard_screen.dart'
    as _i4;
import 'package:marvel_stream/feature/downloads/presentation/screens/downloads_screen.dart'
    as _i5;
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart'
    as _i14;
import 'package:marvel_stream/feature/home/presentation/screens/home_screen.dart'
    as _i6;
import 'package:marvel_stream/feature/more/presentation/screens/more_screen.dart'
    as _i7;
import 'package:marvel_stream/feature/movie/presentation/screens/movie_detail_screen.dart' as _i8;
import 'package:marvel_stream/feature/on_boarding/presentation/screens/onboarding_screen.dart'
    as _i9;

import 'package:marvel_stream/feature/splash/presentation/screens/splash_screen.dart'
    as _i12;

/// generated route for
/// [_i1.AuthRouterPage]
class AuthRouter extends _i13.PageRouteInfo<void> {
  const AuthRouter({List<_i13.PageRouteInfo>? children})
    : super(AuthRouter.name, initialChildren: children);

  static const String name = 'AuthRouter';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthRouterPage();
    },
  );
}

/// generated route for
/// [_i2.CategoriesScreen]
class CategoriesRoute extends _i13.PageRouteInfo<void> {
  const CategoriesRoute({List<_i13.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i3.DashboardRouterPage]
class DashboardRouter extends _i13.PageRouteInfo<void> {
  const DashboardRouter({List<_i13.PageRouteInfo>? children})
    : super(DashboardRouter.name, initialChildren: children);

  static const String name = 'DashboardRouter';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardRouterPage();
    },
  );
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i5.DownloadsScreen]
class DownloadsRoute extends _i13.PageRouteInfo<void> {
  const DownloadsRoute({List<_i13.PageRouteInfo>? children})
    : super(DownloadsRoute.name, initialChildren: children);

  static const String name = 'DownloadsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.DownloadsScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.MoreScreen]
class MoreRoute extends _i13.PageRouteInfo<void> {
  const MoreRoute({List<_i13.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.MoreScreen();
    },
  );
}

/// generated route for
/// [_i8.MovieDetailScreen]
class MovieDetailRoute extends _i13.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required _i14.MovieEntity movie,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(movie: movie, key: key),
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i8.MovieDetailScreen(movie: args.movie, key: args.key);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({required this.movie, this.key});

  final _i14.MovieEntity movie;

  final _i15.Key? key;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movie: $movie, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailRouteArgs) return false;
    return movie == other.movie && key == other.key;
  }

  @override
  int get hashCode => movie.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i9.OnboardingScreen]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i10.SignInScreen]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i15.Key? key,
    _i15.VoidCallback? onLoggedIn,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return _i10.SignInScreen(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onLoggedIn});

  final _i15.Key? key;

  final _i15.VoidCallback? onLoggedIn;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key && onLoggedIn == other.onLoggedIn;
  }

  @override
  int get hashCode => key.hashCode ^ onLoggedIn.hashCode;
}

/// generated route for
/// [_i11.SignUpScreen]
class SignUpRoute extends _i13.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i15.Key? key,
    _i15.VoidCallback? onLoggedIn,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i11.SignUpScreen(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.onLoggedIn});

  final _i15.Key? key;

  final _i15.VoidCallback? onLoggedIn;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key && onLoggedIn == other.onLoggedIn;
  }

  @override
  int get hashCode => key.hashCode ^ onLoggedIn.hashCode;
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}
