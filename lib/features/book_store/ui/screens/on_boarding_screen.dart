import 'package:book_store/config/routes.dart';
import 'package:book_store/features/book_store/blocs/main/main.dart';
import 'package:book_store/features/book_store/ui/widgets/dot_indicator.dart';
import 'package:book_store/locale/app_localization.dart';
import 'package:book_store/util/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _actualPage;

  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _actualPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc,MainState>(
      listener: (context,state){
        if (state is LoadingMainScreen){
          changeRoute(context, Routes.main, true);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(

            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    height: 50,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: PageView(
                      controller: _controller,
                      children: <Widget>[page(1), page(2)],
                      onPageChanged: (intPage)=> this.setState(()=>_actualPage=intPage),
                    ),
                  ),
                  Expanded(
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          DotIndicator(_actualPage == 0),
                          DotIndicator(_actualPage != 0)
                        ],
                      ),
                      _actualPage != 0
                          ? RaisedButton(
                          child: Text(AppLocalization().start.toUpperCase()),
                      onPressed: ()=>BlocProvider.of<MainBloc>(context).add(LoadMainScreen()),)
                          : Container()
                    ],),
                  )

                ]),
          ),
        ),
      ),
    );
  }

  Column page(int actualPage) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          actualPage == 1
              ? "assets/images/onboarding1.png"
              : "assets/images/onboarding2.png",
          height: 200,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            actualPage == 1
                ? AppLocalization().onBoardingMessage1
                : AppLocalization().onBoardingMessage2,
            style: Theme.of(context).textTheme.body1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
