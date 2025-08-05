// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i18;

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i17;
import 'package:marvel_stream/core/navigation/router/auth_router.dart' as _i1;
import 'package:marvel_stream/core/navigation/router/dashboard_router.dart'
    as _i4;
import 'package:marvel_stream/feature/auth/presentation/screens/sign_in_screen.dart'
    as _i12;
import 'package:marvel_stream/feature/auth/presentation/screens/sign_up_screen.dart'
    as _i13;
import 'package:marvel_stream/feature/characters/presentation/screens/characters_screen.dart'
    as _i2;
import 'package:marvel_stream/feature/comics/presentation/screens/comics_screen.dart'
    as _i3;
import 'package:marvel_stream/feature/common/presentation/screens/dashboard_screen.dart'
    as _i5;
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart'
    as _i16;
import 'package:marvel_stream/feature/home/presentation/screens/home_screen.dart'
    as _i6;
import 'package:marvel_stream/feature/more/presentation/screens/more_screen.dart'
    as _i7;
import 'package:marvel_stream/feature/movie/presentation/screens/movie_detail_screen.dart'
    as _i8;
import 'package:marvel_stream/feature/news/presentation/screens/news_screen.dart'
    as _i9;
import 'package:marvel_stream/feature/on_boarding/presentation/screens/onboarding_screen.dart'
    as _i10;
import 'package:marvel_stream/feature/profile/presentation/screens/profile_screen.dart'
    as _i11;
import 'package:marvel_stream/feature/splash/presentation/screens/splash_screen.dart'
    as _i14;

/// generated route for
/// [_i1.AuthRouterPage]
class AuthRouter extends _i15.PageRouteInfo<void> {
  const AuthRouter({List<_i15.PageRouteInfo>? children})
    : super(AuthRouter.name, initialChildren: children);

  static const String name = 'AuthRouter';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthRouterPage();
    },
  );
}

/// generated route for
/// [_i2.CharactersScreen]
class CharactersRoute extends _i15.PageRouteInfo<void> {
  const CharactersRoute({List<_i15.PageRouteInfo>? children})
    : super(CharactersRoute.name, initialChildren: children);

  static const String name = 'CharactersRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.CharactersScreen();
    },
  );
}

/// generated route for
/// [_i3.ComicsScreen]
class ComicsRoute extends _i15.PageRouteInfo<void> {
  const ComicsRoute({List<_i15.PageRouteInfo>? children})
    : super(ComicsRoute.name, initialChildren: children);

  static const String name = 'ComicsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.ComicsScreen();
    },
  );
}

/// generated route for
/// [_i4.DashboardRouterPage]
class DashboardRouter extends _i15.PageRouteInfo<void> {
  const DashboardRouter({List<_i15.PageRouteInfo>? children})
    : super(DashboardRouter.name, initialChildren: children);

  static const String name = 'DashboardRouter';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardRouterPage();
    },
  );
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.MoreScreen]
class MoreRoute extends _i15.PageRouteInfo<void> {
  const MoreRoute({List<_i15.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.MoreScreen();
    },
  );
}

/// generated route for
/// [_i8.MovieDetailScreen]
class MovieDetailRoute extends _i15.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required _i16.MovieEntity movie,
    _i17.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(movie: movie, key: key),
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i8.MovieDetailScreen(movie: args.movie, key: args.key);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({required this.movie, this.key});

  final _i16.MovieEntity movie;

  final _i17.Key? key;

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
/// [_i9.NewsScreen]
class NewsRoute extends _i15.PageRouteInfo<void> {
  const NewsRoute({List<_i15.PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.NewsScreen();
    },
  );
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i15.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i17.Key? key,
    _i18.Future<void> Function({bool isFromSignup})? onLoggedIn,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i10.OnboardingScreen(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onLoggedIn});

  final _i17.Key? key;

  final _i18.Future<void> Function({bool isFromSignup})? onLoggedIn;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileRoute extends _i15.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i17.Key? key,
    _i17.VoidCallback? onProfileCompleted,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ProfileRoute.name,
         args: ProfileRouteArgs(
           key: key,
           onProfileCompleted: onProfileCompleted,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>(
        orElse: () => const ProfileRouteArgs(),
      );
      return _i11.ProfileScreen(
        key: args.key,
        onProfileCompleted: args.onProfileCompleted,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.onProfileCompleted});

  final _i17.Key? key;

  final _i17.VoidCallback? onProfileCompleted;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, onProfileCompleted: $onProfileCompleted}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return key == other.key && onProfileCompleted == other.onProfileCompleted;
  }

  @override
  int get hashCode => key.hashCode ^ onProfileCompleted.hashCode;
}

/// generated route for
/// [_i12.SignInScreen]
class SignInRoute extends _i15.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i17.Key? key,
    _i18.Future<void> Function({bool isFromSignup})? onLoggedIn,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return _i12.SignInScreen(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onLoggedIn});

  final _i17.Key? key;

  final _i18.Future<void> Function({bool isFromSignup})? onLoggedIn;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i13.SignUpScreen]
class SignUpRoute extends _i15.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i17.Key? key,
    _i18.Future<void> Function({bool isFromSignup})? onLoggedIn,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, onLoggedIn: onLoggedIn),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return _i13.SignUpScreen(key: args.key, onLoggedIn: args.onLoggedIn);
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.onLoggedIn});

  final _i17.Key? key;

  final _i18.Future<void> Function({bool isFromSignup})? onLoggedIn;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, onLoggedIn: $onLoggedIn}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.SplashScreen();
    },
  );
}
