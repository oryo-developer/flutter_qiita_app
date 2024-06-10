import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_qiita_app/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef Json = Map<String, dynamic>;

late final SharedPreferences sharedPreferences;

Dio get dio {
  const baseUrl = 'https://qiita.com/api/v2';
  const accessToken = String.fromEnvironment('ACCESS_TOKEN');
  final headers = {'Authorization': 'Bearer $accessToken'};
  final options = BaseOptions(baseUrl: baseUrl, headers: headers);
  return Dio(options);
}

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  sharedPreferences = await SharedPreferences.getInstance();

  FlutterNativeSplash.remove();

  runApp(const ProviderScope(child: App()));
}
