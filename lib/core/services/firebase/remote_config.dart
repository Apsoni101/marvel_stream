import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class RemoteConfig {
  RemoteConfig._();

  static const String _apiKeyField = 'marvel_api_key';
  static const String _hashField = 'marvel_hash';
  static const String _tsField = 'marvel_ts';

  static late String _apiKey;
  static late String _hash;
  static late String _timestamp;

  static String get apiKey => _apiKey;
  static String get hash => _hash;
  static String get timestamp => _timestamp;

  static Future<void> setup() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(minutes: 30),
        ),
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        debugPrint('RemoteConfig PlatformException: $e');
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('RemoteConfig config setting error: $e');
      }
    }

    try {
      await remoteConfig.fetchAndActivate();

      _apiKey = remoteConfig.getString(_apiKeyField);
      _hash = remoteConfig.getString(_hashField);
      _timestamp = remoteConfig.getString(_tsField);

      if (_apiKey.isEmpty || _hash.isEmpty || _timestamp.isEmpty) {
        throw Exception('Missing one or more required Marvel API values');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('RemoteConfig fetch/parse error: $e');
      }
      rethrow;
    }
  }
}
