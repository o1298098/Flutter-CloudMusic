import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ScrollVideoPageAction { action }

class ScrollVideoPageActionCreator {
  static Action onAction() {
    return const Action(ScrollVideoPageAction.action);
  }
}
