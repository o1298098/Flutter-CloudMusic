import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ScrollVideoPageState> buildEffect() {
  return combineEffects(<Object, Effect<ScrollVideoPageState>>{
    ScrollVideoPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ScrollVideoPageState> ctx) {
}
