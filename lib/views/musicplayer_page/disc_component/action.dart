import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiscAction { action }

class DiscActionCreator {
  static Action onAction() {
    return const Action(DiscAction.action);
  }
}
