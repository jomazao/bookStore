import 'package:book_store/features/book_store/models/Book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL = "https://api.itbook.store/1.0";

Future<List<Book>> getNewReleases() async {
  try {
    var url = "${BASE_URL}/new";

    var response = await http.get(url);

    Map responseData = json.decode(response.body);
    List booksJson = responseData["books"];
    List<Book> books = List();
    if (booksJson.length > 0) {
      books = booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
    }

    return books;
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return List();
  }
}

Future<List<Book>> getBooksByQuery(String query, int page) async {
  try {
    var url = "${BASE_URL}/search/${query}?page=${page}";

    var response = await http.get(url);

    Map responseData = json.decode(response.body);
    List booksJson = responseData["books"];
    List<Book> books = List();
    if (booksJson.length > 0) {
      books = booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
    }

    return books;
  } catch (e) {
    print("error: ${e}");
    return List();
  }
}

Future<Book> getBookDetails(String isbn13) async {
  try {
    var url = "${BASE_URL}/books/${isbn13}";
    print("La url es: ${url}");
    var response = await http.get(url);
    Map responseData = json.decode(response.body);
    print(responseData);
    return Book.fromJson(responseData);
  } catch (e, stacktrace) {
    print("error1: ${e}");
    print(stacktrace);
    return Book();
  }
}
