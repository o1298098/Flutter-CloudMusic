import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MusicPlayerPageState> buildEffect() {
  return combineEffects(<Object, Effect<MusicPlayerPageState>>{
    MusicPlayerPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MusicPlayerPageState> ctx) {
}
