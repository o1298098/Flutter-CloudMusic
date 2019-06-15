import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicPlayerPageAction {action,play,pause,stop}

class MusicPlayerPageActionCreator {
  static Action onAction() {
    return const Action(MusicPlayerPageAction.action);
  }
  static Action onPlay(String url){
    return Action(MusicPlayerPageAction.play,payload: url);
  }
}
