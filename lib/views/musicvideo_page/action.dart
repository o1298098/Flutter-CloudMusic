import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicVideoPageAction { action }

class MusicVideoPageActionCreator {
  static Action onAction() {
    return const Action(MusicVideoPageAction.action);
  }
}
