import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<StartUpPageState> buildEffect() {
  return combineEffects(<Object, Effect<StartUpPageState>>{
    StartUpPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<StartUpPageState> ctx) {
}
