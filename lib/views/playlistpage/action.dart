import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayListPageAction { action }

class PlayListPageActionCreator {
  static Action onAction() {
    return const Action(PlayListPageAction.action);
  }
}
