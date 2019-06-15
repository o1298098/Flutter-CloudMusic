import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiscState> buildEffect() {
  return combineEffects(<Object, Effect<DiscState>>{
    DiscAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DiscState> ctx) {
}
