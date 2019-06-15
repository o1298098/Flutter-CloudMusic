import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StartUpPageAction { action }

class StartUpPageActionCreator {
  static Action onAction() {
    return const Action(StartUpPageAction.action);
  }
}
