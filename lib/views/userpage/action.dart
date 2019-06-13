import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserPageAction { action }

class UserPageActionCreator {
  static Action onAction() {
    return const Action(UserPageAction.action);
  }
}
