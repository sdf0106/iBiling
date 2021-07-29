import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'main_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: context.localizationDelegates,
      //   supportedLocales: context.supportedLocales,
      //   locale: context.locale,
        debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}