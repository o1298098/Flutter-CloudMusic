import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PersonalizedState> buildReducer() {
  return asReducer(
    <Object, Reducer<PersonalizedState>>{
      PersonalizedAction.action: _onAction,
    },
  );
}

PersonalizedState _onAction(PersonalizedState state, Action action) {
  final PersonalizedState newState = state.clone();
  return newState;
}
