import 'package:flutter/material.dart';
import 'package:ibiling/ui/screens/contracts.dart';
import 'package:ibiling/ui/screens/create.dart';
import 'package:ibiling/ui/screens/history.dart';
import 'package:ibiling/ui/screens/profile.dart';
import 'package:ibiling/ui/screens/saved.dart';
import 'package:easy_localization/easy_localization.dart';

class Constants {
  static List<Widget> pages = [
    Contracts(),
    History(),
    Create(index: 0),
    Saved(),
    Profile(),
  ];
  static List<String> titles = [
    'contract'.tr(),
    'history'.tr(),
    'new_contract'.tr(),
    'saved'.tr(),
    'profile'.tr(),
  ];
}
