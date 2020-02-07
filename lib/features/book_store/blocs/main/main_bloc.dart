import 'package:bloc/bloc.dart';
import 'package:book_store/features/book_store/blocs/main/main.dart';
import 'package:book_store/features/book_store/data/books_repository.dart';
import 'package:book_store/features/book_store/models/Book.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  List<Book> books;
  MainBloc() {
    books = List();
  }

  @override
  MainState get initialState => AppStart();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is LoadMainScreen) {
      yield LoadingMainScreen();
    } else if (event is LoadNewReleases) {
      yield LoadingBooks();
      try {
        List<Book> books = await getNewReleases();
        yield LoadedBooks(books);
      } catch (e) {
        print(e);
        yield NoMoreBooks();
      }
    } else if (event is LoadBookDetails) {
      yield LoadingBookDetails(event.book);
      Book book=await getBookDetails(event.book.isbn13);
      yield LoadedBookDetails(book);

    }
  }
}
