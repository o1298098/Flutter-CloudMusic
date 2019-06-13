import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginPageAction { action }

class LoginPageActionCreator {
  static Action onAction() {
    return const Action(LoginPageAction.action);
  }
}
