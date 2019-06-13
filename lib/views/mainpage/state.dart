import 'package:fish_redux/fish_redux.dart';

class MainPageState implements Cloneable<MainPageState> {

  @override
  MainPageState clone() {
    return MainPageState();
  }
}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState();
}
