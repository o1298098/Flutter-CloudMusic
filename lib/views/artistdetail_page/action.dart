import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum artistdetailAction { action }

class artistdetailActionCreator {
  static Action onAction() {
    return const Action(artistdetailAction.action);
  }
}
