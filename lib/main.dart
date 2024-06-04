import 'package:flutter/material.dart';
import 'package:flutter_qiita_app/app.dart';
import 'package:flutter_qiita_app/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const ProviderScope(child: App()));
}
