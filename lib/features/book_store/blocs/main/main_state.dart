import 'package:book_store/features/book_store/models/Book.dart';
import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {


   MainState();

  @override
  List<Object> get props => [];
}

class AppStart extends MainState{

}
class LoadingMainScreen extends MainState{

}

class LoadingBooks extends MainState{

}

class LoadedBooks extends MainState {

  List<Book> books;
  LoadedBooks(this.books);

}

class NoMoreBooks extends MainState {

}