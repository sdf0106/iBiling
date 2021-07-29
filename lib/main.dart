import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibiling/ui/my_app.dart';
import 'package:ibiling/ui/screens/contracts.dart';
import 'package:ibiling/ui/style/theme.dart' as Style;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
    // EasyLocalization(
    //   supportedLocales: [Locale('en'), Locale('ru'), Locale('uz')],
    //   path: 'assets/translations/',
    //   fallbackLocale: Locale('en'),
      MyApp(),
   // ),
  );
}
