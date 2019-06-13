import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicPlayerPageAction { action }

class MusicPlayerPageActionCreator {
  static Action onAction() {
    return const Action(MusicPlayerPageAction.action);
  }
}
