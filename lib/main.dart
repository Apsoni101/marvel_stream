import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/controller/language_controller.dart';
import 'package:marvel_stream/core/controller/theme_controller.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/enums/app_languages.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/localisation/app_localizations.dart';
import 'package:marvel_stream/core/navigation/app_router.dart';
import 'package:marvel_stream/core/services/firebase/crashlytics_service.dart';
import 'package:marvel_stream/core/services/firebase/remote_config.dart';
import 'package:marvel_stream/core/services/storage/shared_prefs_service.dart';
import 'package:marvel_stream/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await RemoteConfig.setup();
  await AppInjector.setUp();
  await AppInjector.getIt<SharedPrefsService>().initSharedPreferences();
  await AppInjector.getIt<ThemeController>().initialize();
  await AppInjector.getIt<LanguageController>().initialize();
  await AppInjector.getIt<CrashlyticsService>().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ValueNotifier<(ThemeMode, AppLanguage)> _combinedNotifier;
  late final ThemeController _themeController;
  late final LanguageController _languageController;

  @override
  void initState() {
    super.initState();
    _themeController = AppInjector.getIt<ThemeController>();
    _languageController = AppInjector.getIt<LanguageController>();

    _combinedNotifier = ValueNotifier((
      _themeController.value,
      _languageController.value,
    ),);

    _themeController.addListener(_updateCombined);
    _languageController.addListener(_updateCombined);
  }

  void _updateCombined() {
    _combinedNotifier.value = (
      _themeController.value,
      _languageController.value,
    );
  }

  @override
  void dispose() {
    _themeController.removeListener(_updateCombined);
    _languageController.removeListener(_updateCombined);
    _combinedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return ValueListenableBuilder<(ThemeMode, AppLanguage)>(
      valueListenable: _combinedNotifier,
      builder: (
        final BuildContext context,
        final (ThemeMode, AppLanguage) value,
        _,
      ) {
        final (ThemeMode themeMode, AppLanguage appLanguage) = value;

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            indicatorColor: context.appColors.red,
            colorScheme: ColorScheme.fromSeed(seedColor: context.appColors.red),
            scaffoldBackgroundColor: context.appColors.black,
            appBarTheme: AppBarTheme(backgroundColor: context.appColors.black),
          ),
          darkTheme: ThemeData(
            indicatorColor: context.appColors.red,
            colorScheme: ColorScheme.fromSeed(
              seedColor: context.appColors.red,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: context.appColors.permanentBlack,
            appBarTheme: AppBarTheme(backgroundColor: context.appColors.black),
          ),
          themeMode: themeMode,
          locale: appLanguage.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
