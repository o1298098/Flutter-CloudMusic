import 'package:fish_redux/fish_redux.dart';

class SongCommentPageState implements Cloneable<SongCommentPageState> {

  @override
  SongCommentPageState clone() {
    return SongCommentPageState();
  }
}

SongCommentPageState initState(Map<String, dynamic> args) {
  return SongCommentPageState();
}
