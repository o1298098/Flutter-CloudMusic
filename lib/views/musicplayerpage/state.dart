import 'package:fish_redux/fish_redux.dart';

class MusicPlayerPageState implements Cloneable<MusicPlayerPageState> {

  @override
  MusicPlayerPageState clone() {
    return MusicPlayerPageState();
  }
}

MusicPlayerPageState initState(Map<String, dynamic> args) {
  return MusicPlayerPageState();
}
