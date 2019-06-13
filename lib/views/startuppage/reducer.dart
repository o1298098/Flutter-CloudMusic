import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StartUpPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<StartUpPageState>>{
      StartUpPageAction.action: _onAction,
    },
  );
}

StartUpPageState _onAction(StartUpPageState state, Action action) {
  final StartUpPageState newState = state.clone();
  return newState;
}
