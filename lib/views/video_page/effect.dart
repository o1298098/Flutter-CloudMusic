import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VideoPageState> buildEffect() {
  return combineEffects(<Object, Effect<VideoPageState>>{
    VideoPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VideoPageState> ctx) {
}
