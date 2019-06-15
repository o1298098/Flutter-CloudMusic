import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayListPageAction { action ,init}

class PlayListPageActionCreator {
  static Action onAction() {
    return const Action(PlayListPageAction.action);
  }
  static Action onInit(MusicPlayList b) {
    return Action(PlayListPageAction.init,payload: b);
  }

}
