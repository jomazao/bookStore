import 'dart:async';

import 'package:book_store/config/routes.dart';
import 'package:book_store/features/book_store/blocs/main/main.dart';
import 'package:book_store/features/book_store/blocs/main/main_bloc.dart';
import 'package:book_store/features/book_store/blocs/main/main_state.dart';
import 'package:book_store/features/book_store/models/Book.dart';
import 'package:book_store/features/book_store/ui/widgets/book_widget.dart';
import 'package:book_store/util/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Book> _books;

  final _searchQuery = new TextEditingController();
  Timer _debounce;
  ScrollController controller;
  bool search=true;
  int actualPage;
  String query;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(LoadNewReleases(false));
    actualPage = 1;

    _books = new List();
    super.initState();
    query = "";
    _searchQuery.addListener(_onSearchChanged);
    controller = new ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 500 && query.length > 1 && search) {
      BlocProvider.of<MainBloc>(context).add(SearchByWord(query, false));
    }
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {


      if (query != _searchQuery.text) {
        query = _searchQuery.text;
        if (query.length > 1) {
          BlocProvider.of<MainBloc>(context).add(SearchByWord(query, true));
          search=true;
        } else {
          BlocProvider.of<MainBloc>(context).add(LoadNewReleases(true));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(listener: (context, state) {
      if (state is LoadingBookDetails) {
        changeRoute(context, Routes.booDetails, false);
      }
    }, builder: (context, state) {
      if (state is LoadedBooks) {
        _books = state.books;
      }
      if(state is NoMoreBooks){
        search=false;
      }

      return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.search),
          title: TextField(
            controller: _searchQuery,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          controller: controller,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: addBookWidgets(_books),
                )),
            state is LoadingBooks
                ? Align(child: CircularProgressIndicator())
                : Container()
          ],
        ),
      );
    });
  }

  addBookWidgets(List<Book> books) {
    List<BookWidget> bookWidgets = new List();
    for (Book book in books) {
      bookWidgets.add(BookWidget(
        book,
        action: () => this.showBookDetails(book),
      ));
    }

    return bookWidgets;
  }

  showBookDetails(Book book) {
    BlocProvider.of<MainBloc>(context).add(LoadBookDetails(book));
  }
}
