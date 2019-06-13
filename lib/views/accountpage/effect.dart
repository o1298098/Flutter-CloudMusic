import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AccountPageState> buildEffect() {
  return combineEffects(<Object, Effect<AccountPageState>>{
    AccountPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AccountPageState> ctx) {
}
