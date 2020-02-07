import 'package:bloc/bloc.dart';
import 'package:book_store/features/book_store/blocs/main/main.dart';
import 'package:book_store/features/book_store/data/books_repository.dart';
import 'package:book_store/features/book_store/models/Book.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  List<Book> books;
  int actualPage;
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
        List<Book> booksFounded = await getNewReleases();
        if (event.clear){

          books=booksFounded;
          yield LoadedBooks(books);
        }else{
          books.addAll(booksFounded);

          yield LoadedBooks(books);
        }


      } catch (e) {
        print(e);
        yield NoMoreBooks();
      }
    } else if (event is LoadBookDetails) {
      yield LoadingBookDetails(event.book);
      Book book=await getBookDetails(event.book.isbn13);
      yield LoadedBookDetails(book);

    }else if (event is SearchByWord){
      yield LoadingBooks();
      if(event.clear){
        actualPage=1;
      }
      List<Book> booksFounded = await getBooksByQuery(event.query,actualPage  );

      if(booksFounded.length==0){
        yield NoMoreBooks();
      }else{
        actualPage++;
        if (event.clear){
          books=booksFounded;

          yield LoadedBooks(books);
        }else{
          books.addAll(booksFounded);

          yield LoadedBooks(books);
        }
      }



    }
  }
}
