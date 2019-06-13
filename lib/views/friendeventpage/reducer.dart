import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FriendEventPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<FriendEventPageState>>{
      FriendEventPageAction.action: _onAction,
    },
  );
}

FriendEventPageState _onAction(FriendEventPageState state, Action action) {
  final FriendEventPageState newState = state.clone();
  return newState;
}
