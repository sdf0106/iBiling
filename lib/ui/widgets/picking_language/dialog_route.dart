import 'dart:ui';
import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder _builder;

  HeroDialogRoute({
    required WidgetBuilder builder,
   
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(fullscreenDialog: fullscreenDialog);
  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Color(0xFF0C0C0C).withOpacity(0.8);

  @override
  String get barrierLabel => 'Languages';


  Widget buildTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }
}
