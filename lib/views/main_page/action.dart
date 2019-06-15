import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainPageAction { action ,onPageTap}

class MainPageActionCreator {
  static Action onAction() {
    return const Action(MainPageAction.action);
  }
  static Action onPageTapAction(int index) {
    return Action(MainPageAction.onPageTap, payload: index);
  }
}
