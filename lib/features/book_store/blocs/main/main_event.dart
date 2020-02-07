

import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable{
  const MainEvent();

}

class LoadMainScreen extends MainEvent{

  @override
  List<Object> get props => null;


}