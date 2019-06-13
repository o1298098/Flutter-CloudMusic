import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainPageAction { action }

class MainPageActionCreator {
  static Action onAction() {
    return const Action(MainPageAction.action);
  }
}
