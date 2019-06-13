import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainPageState>>{
      MainPageAction.action: _onAction,
    },
  );
}

MainPageState _onAction(MainPageState state, Action action) {
  final MainPageState newState = state.clone();
  return newState;
}
