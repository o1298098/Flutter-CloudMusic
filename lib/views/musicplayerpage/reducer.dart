import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MusicPlayerPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MusicPlayerPageState>>{
      MusicPlayerPageAction.action: _onAction,
    },
  );
}

MusicPlayerPageState _onAction(MusicPlayerPageState state, Action action) {
  final MusicPlayerPageState newState = state.clone();
  return newState;
}
