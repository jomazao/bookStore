import 'package:book_store/features/book_store/blocs/main/main.dart';
import 'package:book_store/features/book_store/models/Book.dart';
import 'package:book_store/locale/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailScreen extends StatefulWidget {
  BookDetailScreen();

  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  Book book;

  @override
  void initState() {
    super.initState();
    book = Book();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {

      if(state is LoadBookDetails){
        book= state.props[0];
      }

        print(state.props);
      return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: ListView(
          children: <Widget>[

            detail(AppLocalization().price,book.price),
            detail(AppLocalization().raiting,"${book.raiting}"),
            detail(AppLocalization().author,book.authors),
            detail(AppLocalization().publisher,book.publisher),
            //detail(AppLocalization().published,book.publ),
            detail(AppLocalization().pages,"${book.pages}"),
            detail(AppLocalization().language,book.language),
            //detail(AppLocalization().format,book.format),
            detail(AppLocalization().isbn10,book.isbn10),
            detail(AppLocalization().isbn13,book.isbn13),



          ],
        ),
      );
    });
  }

  Widget detail(String title,String text){
      Row(children: <Widget>[

        Flexible(flex:2,child: Text(title)),
        Flexible(flex:8,child: Text(text))

      ],);
  }
}
