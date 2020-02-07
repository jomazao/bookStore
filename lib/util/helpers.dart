import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:book_store/config/application.dart';

import 'package:shared_preferences/shared_preferences.dart';
Future<SharedPreferences> getSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

//this functions reduce Aplication.router.navigateTo() to changeRoute()
void changeRoute(BuildContext context, String route, bool replace,
    {TransitionType transitionType}) {
  Application.router.navigateTo(
    context,
    route,
    replace: replace,
    transition:
    (transitionType != null) ? transitionType : TransitionType.native,
  );
}