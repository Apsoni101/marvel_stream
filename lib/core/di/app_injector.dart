import 'package:get_it/get_it.dart';
import 'package:marvel_stream/core/navigation/auth_guard.dart';
import 'package:marvel_stream/core/services/firebase/crashlytics_service.dart';
import 'package:marvel_stream/core/services/firebase/firebase_auth_service.dart';
import 'package:marvel_stream/core/services/firebase/firebase_firestore_service.dart';
import 'package:marvel_stream/core/services/networking/network_service.dart';
import 'package:marvel_stream/core/services/storage/shared_prefs_service.dart';
import 'package:marvel_stream/feature/auth/data/data_sources/auth_local_data_source.dart';
import 'package:marvel_stream/feature/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:marvel_stream/feature/auth/data/repositories/auth_repo_impl.dart';
import 'package:marvel_stream/feature/auth/domain/repositories/auth_repo.dart';
import 'package:marvel_stream/feature/auth/domain/use_cases/auth_usecase.dart';
import 'package:marvel_stream/feature/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:marvel_stream/feature/auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:marvel_stream/feature/home/data/data_sources/movie_data_source.dart';
import 'package:marvel_stream/feature/home/data/repositories/movie_list_repo_impl.dart';
import 'package:marvel_stream/feature/home/domain/repositories/movie_list_repo.dart';
import 'package:marvel_stream/feature/home/domain/use_cases/movies_use_case.dart';
import 'package:marvel_stream/feature/home/presentation/bloc/movies_bloc.dart';
import 'package:marvel_stream/feature/more/data/data_sources/more_remote_data_source.dart';
import 'package:marvel_stream/feature/more/data/repositories/more_repository_impl.dart';
import 'package:marvel_stream/feature/more/domain/repositories/more_repository.dart';
import 'package:marvel_stream/feature/more/domain/use_cases/more_usecase.dart';
import 'package:marvel_stream/feature/more/presentation/bloc/more_bloc.dart';
import 'package:marvel_stream/feature/movie/presentation/bloc/movie_detail_bloc.dart';

class AppInjector {
  AppInjector._();

  static final GetIt getIt = GetIt.instance;

  static Future<void> setUp() async {
    getIt
      // Core Services
      ..registerLazySingleton(SharedPrefsService.new)
      ..registerLazySingleton(FirebaseAuthService.new)
      ..registerLazySingleton(FirebaseFirestoreService.new)
      ..registerLazySingleton(CrashlyticsService.new)
      ..registerLazySingleton(NetworkService.new)
      // Auth Feature
      ..registerLazySingleton<AuthGuard>(
        () => AuthGuard(firebaseAuthService: getIt<FirebaseAuthService>()),
      )
      ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
          authService: getIt<FirebaseAuthService>(),
          firestoreService: getIt<FirebaseFirestoreService>(),
        ),
      )
      ..registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(
          sharedPrefsService: getIt<SharedPrefsService>(),
        ),
      )
      ..registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(
          authRemoteDataSource: getIt<AuthRemoteDataSource>(),
          authLocalDataSource: getIt<AuthLocalDataSource>(),
        ),
      )
      ..registerLazySingleton<AuthUseCase>(
        () => AuthUseCase(authRepo: getIt<AuthRepo>()),
      )
      ..registerFactory(() => LoginBloc(authUseCase: getIt<AuthUseCase>()))
      ..registerFactory(() => SignupBloc(authUseCase: getIt<AuthUseCase>()))
      //home feature
      ..registerLazySingleton<MovieListRemoteDataSource>(
        () => MovieListRemoteDataSourceImpl(
          networkService: getIt<NetworkService>(),
        ),
      )
      ..registerLazySingleton<MovieListRepository>(
        () => MovieListRepositoryImpl(
          remoteDataSource: getIt<MovieListRemoteDataSource>(),
        ),
      )
      ..registerLazySingleton<MoviesUseCase>(
        () => MoviesUseCase(repository: getIt<MovieListRepository>()),
      )
      ..registerFactory(() => MoviesBloc(moviesUseCase: getIt<MoviesUseCase>()))
      ..registerFactory(MovieDetailBloc.new)

      //More feature
      ..registerLazySingleton<MoreRemoteDataSource>(
        () => MoreRemoteDataSourceImpl(
          firebaseAuthService: getIt<FirebaseAuthService>(),
        ),
      )
      ..registerLazySingleton<MoreRepository>(
        () =>
            MoreRepositoryImpl(remoteDataSource: getIt<MoreRemoteDataSource>()),
      )
      ..registerLazySingleton<MoreRepositoryUseCase>(
        () => MoreRepositoryUseCase(getIt<MoreRepository>()),
      )
      ..registerFactory(
        () => MoreBloc(moreRepositoryUseCase: getIt<MoreRepositoryUseCase>()),
      );
  }
}
