import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MusicVideoPageState> buildEffect() {
  return combineEffects(<Object, Effect<MusicVideoPageState>>{
    MusicVideoPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MusicVideoPageState> ctx) {
}
