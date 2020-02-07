

import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable{
  const MainEvent();

}

class LoadMainScreen extends MainEvent{

  @override
  List<Object> get props => null;


}

class LoadNewReleases extends MainEvent{

  @override
  List<Object> get props => null;

}
class SearchByWord extends MainEvent{

  int page;

  @override
  List<Object> get props => null;
}

