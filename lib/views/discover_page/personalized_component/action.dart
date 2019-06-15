import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PersonalizedAction { action,celltap}

class PersonalizedActionCreator {
  static Action onAction() {
    return const Action(PersonalizedAction.action);
  }

  static Action onCellTap(int id){
    return Action(PersonalizedAction.celltap,payload: id);
  }
}
