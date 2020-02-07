import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable{
  const MainState();
  @override
  List<Object> get props => [];
}

class AppStart extends MainState{

}
class LoadingMainScreen extends MainState{

}
