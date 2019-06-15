import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<VideoPageState>>{
      VideoPageAction.action: _onAction,
    },
  );
}

VideoPageState _onAction(VideoPageState state, Action action) {
  final VideoPageState newState = state.clone();
  return newState;
}
