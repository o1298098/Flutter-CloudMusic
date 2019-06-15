import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VideoPageAction { action }

class VideoPageActionCreator {
  static Action onAction() {
    return const Action(VideoPageAction.action);
  }
}
