import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FriendEventPageAction { action }

class FriendEventPageActionCreator {
  static Action onAction() {
    return const Action(FriendEventPageAction.action);
  }
}
