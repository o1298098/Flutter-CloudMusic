import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiscState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiscState>>{
      DiscAction.action: _onAction,
    },
  );
}

DiscState _onAction(DiscState state, Action action) {
  final DiscState newState = state.clone();
  return newState;
}
