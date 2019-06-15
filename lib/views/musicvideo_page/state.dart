import 'package:fish_redux/fish_redux.dart';

class MusicVideoPageState implements Cloneable<MusicVideoPageState> {

  @override
  MusicVideoPageState clone() {
    return MusicVideoPageState();
  }
}

MusicVideoPageState initState(Map<String, dynamic> args) {
  return MusicVideoPageState();
}
