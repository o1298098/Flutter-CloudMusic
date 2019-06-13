import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserPageState>>{
      UserPageAction.action: _onAction,
    },
  );
}

UserPageState _onAction(UserPageState state, Action action) {
  final UserPageState newState = state.clone();
  return newState;
}
