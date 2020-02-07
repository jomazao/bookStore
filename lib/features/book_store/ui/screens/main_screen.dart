

import 'package:book_store/features/book_store/blocs/main/main_bloc.dart';
import 'package:book_store/features/book_store/blocs/main/main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget{
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<MainBloc,MainState>(

      builder:(context,state){
        return Scaffold();
    }

    );
  }

}