import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/models/pagemodel/discoverpagemodel.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiscoverPageAction { action ,init}

class DiscoverPageActionCreator {
  static Action onAction() {
    return const Action(DiscoverPageAction.action);
  }
   static Action onInit(DiscoverPageModel b) {
    return Action(DiscoverPageAction.init,payload: b);
  }
}
