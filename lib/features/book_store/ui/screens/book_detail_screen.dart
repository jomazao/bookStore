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

      if(state is LoadingBookDetails  ){
        book= state.book;
      }
      if(state is LoadedBookDetails){
        book= state.book;
      }
      print("aquí"+book.toJson().toString());

        print(state.props);
      return Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: ListView(

          shrinkWrap: true,
          children: <Widget>[
            Image.network(book.image,height:250,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: <Widget>[
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
                Align(child: Text(AppLocalization().description,style: Theme.of(context).textTheme.title,)),
               Text(book.desc)
              ],),
            )




          ],
        ),
      );
    });
  }

  Widget detail(String title,String text){
   return    Align(
     child: Row(
       
            children: <Widget>[

          Flexible(flex:3,child: Text("${title}:",style: Theme.of(context).textTheme.title,)),
          Flexible(flex:7,child: Text(text!=null?text:""))

        ],),
   );
  }
}
