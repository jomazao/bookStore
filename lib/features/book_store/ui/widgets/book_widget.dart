import 'package:book_store/features/book_store/models/Book.dart';
import 'package:book_store/locale/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  Book book;
  Function action;

  BookWidget(this.book, {this.action});

  @override
  Widget build(BuildContext context) {
    const double imageHeigth = 200;
    const double marginTop = 100;
    double widthW = (MediaQuery.of(context).size.width / 2) - 40;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: marginTop),
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          width: widthW,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: imageHeigth - marginTop,
              ),
              Text(book.title,textAlign: TextAlign.center,),
              RaisedButton(
                child: Text(
                  AppLocalization().information,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: action,
              )
            ],
          ),
        ),
        Image.network(
          book.image,
          height: imageHeigth,
          width: widthW - 10,
        ),
      ],
    );
  }
}
