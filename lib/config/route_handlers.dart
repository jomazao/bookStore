import 'package:book_store/features/book_store/ui/screens/on_boarding_screen.dart';
import 'package:book_store/features/book_store/ui/screens/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


var OnBoardingHandler= Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OnBoardingScreen(); // * ROOT SCREEN
});

var SplashHandler= Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashScreen(); // * ROOT SCREEN
});