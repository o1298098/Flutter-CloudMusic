import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SongCommentPageState> buildEffect() {
  return combineEffects(<Object, Effect<SongCommentPageState>>{
    SongCommentPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SongCommentPageState> ctx) {
}
