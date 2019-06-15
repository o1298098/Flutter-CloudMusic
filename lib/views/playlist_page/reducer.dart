import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayListPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayListPageState>>{
      PlayListPageAction.action: _onAction,
      PlayListPageAction.init:_onInit
    },
  );
}

PlayListPageState _onAction(PlayListPageState state, Action action) {
  final PlayListPageState newState = state.clone();
  return newState;
}
PlayListPageState _onInit(PlayListPageState state, Action action) {
  final MusicPlayList s=action.payload;
  final PlayListPageState newState = state.clone();
  newState.musicPlayList=s;
  newState.backgroundurl=s.playlist.coverImgUrl;
  return newState;
}

