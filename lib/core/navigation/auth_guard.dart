import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/core/navigation/route_paths.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/firebase/firebase_auth_service.dart';

///authGuard for checking authentication
class AuthGuard extends AutoRouteGuard {
  final FirebaseAuthService firebaseAuthService;

  AuthGuard({required this.firebaseAuthService});

  @override
  Future<void> onNavigation(
    final NavigationResolver resolver,
    final StackRouter router,
  ) async {
    final Either<Failure, bool> isSignedInResult =
        await firebaseAuthService.isSignedIn();

    await isSignedInResult.fold(
      (final Failure failure) async {
        final String currentRoute = router.currentPath;
        if (currentRoute.contains(RoutePaths.signup)) {
          await router.replace(SignUpRoute(onLoggedIn: resolver.next));
        } else {
          await router.replace(SignInRoute(onLoggedIn: resolver.next));
        }
      },
      (final bool isSignedIn) async {
        if (isSignedIn) {
          resolver.next();
        } else {
          final String currentRoute = router.currentPath;
          if (currentRoute.contains(RoutePaths.signup)) {
            await router.replace(SignUpRoute(onLoggedIn: resolver.next));
          } else {
            await router.replace(SignInRoute(onLoggedIn: resolver.next));
          }
        }
      },
    );
  }
}
