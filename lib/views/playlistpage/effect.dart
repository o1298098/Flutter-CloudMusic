import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayListPageState> buildEffect() {
  return combineEffects(<Object, Effect<PlayListPageState>>{
    PlayListPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlayListPageState> ctx) {
}
