import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localisation/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('hi')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Marvel Stream'**
  String get appName;

  /// No description provided for @continueTxt.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueTxt;

  /// No description provided for @onboardingTxt1.
  ///
  /// In en, this message translates to:
  /// **'All your favourite \nMARVEL Movies & Series \nat one place\n'**
  String get onboardingTxt1;

  /// No description provided for @onboardingTxt2.
  ///
  /// In en, this message translates to:
  /// **'Watch Online \nor\n Download Offline\n'**
  String get onboardingTxt2;

  /// No description provided for @onboardingTxt3.
  ///
  /// In en, this message translates to:
  /// **'Create profiles for \ndifferent members & \nget personalised \nrecommendations\n'**
  String get onboardingTxt3;

  /// No description provided for @onboardingTxt4.
  ///
  /// In en, this message translates to:
  /// **'Plans according to your\n needs at affordable\n prices\n'**
  String get onboardingTxt4;

  /// No description provided for @getStartedTxt.
  ///
  /// In en, this message translates to:
  /// **'Let’s Get Started !!!\n'**
  String get getStartedTxt;

  /// No description provided for @signupOrLogin.
  ///
  /// In en, this message translates to:
  /// **'SignUp / Login\n'**
  String get signupOrLogin;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your Email ID'**
  String get enterEmail;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @continueWith.
  ///
  /// In en, this message translates to:
  /// **'Continue With'**
  String get continueWith;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @emailEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty'**
  String get emailEmptyError;

  /// No description provided for @passwordEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get passwordEmptyError;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get loginSuccess;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @comics.
  ///
  /// In en, this message translates to:
  /// **'Comics'**
  String get comics;

  /// No description provided for @characters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get characters;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @series.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get moreInfo;

  /// No description provided for @trailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// No description provided for @noOverViewAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Overview Available'**
  String get noOverViewAvailable;

  /// No description provided for @addToWatchlist.
  ///
  /// In en, this message translates to:
  /// **' + Add to Watchlist'**
  String get addToWatchlist;

  /// No description provided for @noMoviesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No movies available'**
  String get noMoviesAvailable;

  /// No description provided for @imageLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load image'**
  String get imageLoadFailed;

  /// No description provided for @upcomingMovies.
  ///
  /// In en, this message translates to:
  /// **'🎬 Upcoming Movies'**
  String get upcomingMovies;

  /// No description provided for @trendingNow.
  ///
  /// In en, this message translates to:
  /// **'🔥 Trending Now'**
  String get trendingNow;

  /// No description provided for @oldMovies.
  ///
  /// In en, this message translates to:
  /// **'📼 Old Movies'**
  String get oldMovies;

  /// No description provided for @allMoviesCollection.
  ///
  /// In en, this message translates to:
  /// **'🎞️ All Movies Collection'**
  String get allMoviesCollection;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'⏱️ Duration:'**
  String get duration;

  /// No description provided for @director.
  ///
  /// In en, this message translates to:
  /// **'🎥 Director:'**
  String get director;

  /// No description provided for @releaseDate.
  ///
  /// In en, this message translates to:
  /// **'📅 Release Date:'**
  String get releaseDate;

  /// No description provided for @boxOffice.
  ///
  /// In en, this message translates to:
  /// **'💰 Box Office:'**
  String get boxOffice;

  /// No description provided for @phase.
  ///
  /// In en, this message translates to:
  /// **'📍 Phase:'**
  String get phase;

  /// No description provided for @saga.
  ///
  /// In en, this message translates to:
  /// **'🧩 Saga:'**
  String get saga;

  /// No description provided for @chronology.
  ///
  /// In en, this message translates to:
  /// **'🕰️ Chronology:'**
  String get chronology;

  /// No description provided for @postCreditScenes.
  ///
  /// In en, this message translates to:
  /// **'🎞️ Post Credit Scenes:'**
  String get postCreditScenes;

  /// No description provided for @imdbId.
  ///
  /// In en, this message translates to:
  /// **'🎬 IMDB ID:'**
  String get imdbId;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'🗓️ Last Updated:'**
  String get lastUpdated;

  /// No description provided for @trailerNA.
  ///
  /// In en, this message translates to:
  /// **'🎬 Trailer Not Available'**
  String get trailerNA;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

  /// No description provided for @parentalControl.
  ///
  /// In en, this message translates to:
  /// **'Parental Control'**
  String get parentalControl;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @latestComics.
  ///
  /// In en, this message translates to:
  /// **'Latest comics'**
  String get latestComics;

  /// No description provided for @featuredCharacters.
  ///
  /// In en, this message translates to:
  /// **'Featured characters'**
  String get featuredCharacters;

  /// No description provided for @latestCharacters.
  ///
  /// In en, this message translates to:
  /// **'Latest characters'**
  String get latestCharacters;

  /// No description provided for @classicCharacters.
  ///
  /// In en, this message translates to:
  /// **'Classic characters'**
  String get classicCharacters;

  /// No description provided for @classicComics.
  ///
  /// In en, this message translates to:
  /// **'Classic comics'**
  String get classicComics;

  /// No description provided for @trendingComics.
  ///
  /// In en, this message translates to:
  /// **'Trending comics'**
  String get trendingComics;

  /// No description provided for @aToZCharacters.
  ///
  /// In en, this message translates to:
  /// **'A-Z Characters'**
  String get aToZCharacters;

  /// No description provided for @zToACharacters.
  ///
  /// In en, this message translates to:
  /// **'Z-A Characters'**
  String get zToACharacters;

  /// No description provided for @avengersCharacters.
  ///
  /// In en, this message translates to:
  /// **'Avengers'**
  String get avengersCharacters;

  /// No description provided for @spiderVerseCharacters.
  ///
  /// In en, this message translates to:
  /// **'Spider-Verse'**
  String get spiderVerseCharacters;

  /// No description provided for @xMenCharacters.
  ///
  /// In en, this message translates to:
  /// **'X-Men'**
  String get xMenCharacters;

  /// No description provided for @hulkFamilyCharacters.
  ///
  /// In en, this message translates to:
  /// **'Hulk Family'**
  String get hulkFamilyCharacters;

  /// No description provided for @guardiansCharacters.
  ///
  /// In en, this message translates to:
  /// **'Guardians of the Galaxy'**
  String get guardiansCharacters;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'🌙 Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'☀️ Light Mode'**
  String get lightMode;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **' Change Theme'**
  String get changeTheme;

  /// No description provided for @useSystemTheme.
  ///
  /// In en, this message translates to:
  /// **'🖥️ Use System Theme'**
  String get useSystemTheme;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
