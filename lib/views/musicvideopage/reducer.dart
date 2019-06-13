import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MusicVideoPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MusicVideoPageState>>{
      MusicVideoPageAction.action: _onAction,
    },
  );
}

MusicVideoPageState _onAction(MusicVideoPageState state, Action action) {
  final MusicVideoPageState newState = state.clone();
  return newState;
}
