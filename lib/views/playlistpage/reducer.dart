import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayListPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayListPageState>>{
      PlayListPageAction.action: _onAction,
    },
  );
}

PlayListPageState _onAction(PlayListPageState state, Action action) {
  final PlayListPageState newState = state.clone();
  return newState;
}
