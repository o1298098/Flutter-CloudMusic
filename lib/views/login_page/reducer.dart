import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginPageState>>{
      LoginPageAction.action: _onAction,
    },
  );
}

LoginPageState _onAction(LoginPageState state, Action action) {
  final LoginPageState newState = state.clone();
  return newState;
}
