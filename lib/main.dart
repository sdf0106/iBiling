import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibiling/ui/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU'), Locale('uz', "UZ")],
      path: 'assets/translations',
      fallbackLocale: Locale('en','US'),
      child: MyApp(),
    ),
  );
}
