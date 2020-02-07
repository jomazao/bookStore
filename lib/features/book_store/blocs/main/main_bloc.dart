

import 'package:bloc/bloc.dart';
import 'package:book_store/features/book_store/blocs/main/main.dart';

class MainBloc extends Bloc<MainEvent,MainState>{

  MainBloc(){

  }

  @override
  MainState get initialState => AppStart();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {

    if (event is LoadMainScreen){
      yield LoadingMainScreen();
    }
  }


}