import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiita_app/shared_preferences.dart';
import 'package:flutter_qiita_app/ui/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: App()));
}
