import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SongCommentPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<SongCommentPageState>>{
      SongCommentPageAction.action: _onAction,
    },
  );
}

SongCommentPageState _onAction(SongCommentPageState state, Action action) {
  final SongCommentPageState newState = state.clone();
  return newState;
}
