import 'package:bloc/bloc.dart';
import 'package:book_store/styles/theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:book_store/locale/app_localization.dart';

import 'application.dart';
import 'routes.dart';




class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {

  AppLocalizationDelegate localeOverrideDelegate = AppLocalizationDelegate(Locale('en', 'EN'));

  _MyAppState () {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }


  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Book Store',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: Application.router.generator,
      localizationsDelegates: [
        localeOverrideDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('es'), const Locale('es')],
    );
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}