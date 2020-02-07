import 'package:book_store/features/book_store/models/Book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL="https://api.itbook.store/1.0";

Future<List<Book>> getNewReleases() async{

  var url="${BASE_URL}/new";

  var response = await http.post(url);


  Map responseData=  json.decode(response.body);
  List booksJson=  responseData["books"];
  List<Book> books=booksJson.map((bookJson)=>Book.fromJson(bookJson)).toList();

  return   books;

}

Future<Book> getBookDetails(String isbn13) async{

  var url="${BASE_URL}/books/${isbn13}";

  var response = await http.post(url);
  Map responseData=  json.decode(response.body);
  return Book.fromJson(responseData);



}