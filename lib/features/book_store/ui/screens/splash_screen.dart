


import 'package:book_store/config/routes.dart';
import 'package:book_store/util/helpers.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance
        .addPostFrameCallback((_) =>changeRoute(context,Routes.onBoarding,true));

    return Text("");
  }

}