import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AccountPageAction { action }

class AccountPageActionCreator {
  static Action onAction() {
    return const Action(AccountPageAction.action);
  }
}
