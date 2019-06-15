import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SongCommentPageAction { action }

class SongCommentPageActionCreator {
  static Action onAction() {
    return const Action(SongCommentPageAction.action);
  }
}
