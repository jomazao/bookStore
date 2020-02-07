
import 'package:book_store/features/book_store/models/Book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget{

  final Book book;
  BookDetailScreen(this.book);



  _BookDetailScreenState createState() => _BookDetailScreenState();


}

class _BookDetailScreenState extends State<BookDetailScreen>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
    );
  }

}