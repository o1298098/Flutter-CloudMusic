import 'package:fish_redux/fish_redux.dart';

class StartUpPageState implements Cloneable<StartUpPageState> {

  @override
  StartUpPageState clone() {
    return StartUpPageState();
  }
}

StartUpPageState initState(Map<String, dynamic> args) {
  return StartUpPageState();
}
