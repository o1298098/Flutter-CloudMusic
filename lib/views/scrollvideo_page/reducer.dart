import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ScrollVideoPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ScrollVideoPageState>>{
      ScrollVideoPageAction.action: _onAction,
    },
  );
}

ScrollVideoPageState _onAction(ScrollVideoPageState state, Action action) {
  final ScrollVideoPageState newState = state.clone();
  return newState;
}
