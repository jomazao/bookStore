import 'package:book_store/features/book_store/models/Book.dart';
import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class LoadMainScreen extends MainEvent {
  @override
  List<Object> get props => null;
}

class LoadNewReleases extends MainEvent {
  @override
  List<Object> get props => null;
}

class LoadBookDetails extends MainEvent {
  final Book book;
  LoadBookDetails(this.book);

  @override
  List<Object> get props => [book];
}

class SearchByWord extends MainEvent {

  int page;
  String query;
  SearchByWord(this.query,this.page);

  @override
  List<Object> get props => [query,page];
}
