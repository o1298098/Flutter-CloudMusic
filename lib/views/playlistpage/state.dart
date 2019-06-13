import 'package:fish_redux/fish_redux.dart';

class PlayListPageState implements Cloneable<PlayListPageState> {

  @override
  PlayListPageState clone() {
    return PlayListPageState();
  }
}

PlayListPageState initState(Map<String, dynamic> args) {
  return PlayListPageState();
}
