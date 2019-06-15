import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UserPageState> buildEffect() {
  return combineEffects(<Object, Effect<UserPageState>>{
    UserPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserPageState> ctx) {
}
