import 'dart:ui';

import 'package:cloudmusic/globalbasestate/state.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';

class PlayListPageState implements GlobalBaseState<PlayListPageState> {
  MusicPlayList musicPlayList;
  String backgroundurl='';
  int id;
  @override
  PlayListPageState clone() {
    return PlayListPageState();
  }

  @override
  Color themeColor;
}

PlayListPageState initPlayListPageState(Map<String, dynamic> args) {
  PlayListPageState state=new PlayListPageState();
  state.id=args['id'];
  return state;
}
