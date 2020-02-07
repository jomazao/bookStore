import 'package:book_store/features/book_store/ui/screens/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:book_store/config/route_handlers.dart';


class Routes {
  static String root = "/";
  static String onBoarding="/onBoarding";


  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(root, handler: SplashHandler);

    router.define(onBoarding, handler: OnBoardingHandler);


  }
}
