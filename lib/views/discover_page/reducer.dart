import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/models/pagemodel/discoverpagemodel.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiscoverPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiscoverPageState>>{
      DiscoverPageAction.action: _onAction,
      DiscoverPageAction.init:_onInit,
    },
  );
}

DiscoverPageState _onAction(DiscoverPageState state, Action action) {
  final DiscoverPageState newState = state.clone();
  return newState;
}

DiscoverPageState _onInit(DiscoverPageState state, Action action) {
  final DiscoverPageModel pageModel =action.payload??null;
  final DiscoverPageState newState = state.clone();
  newState.pageModel=pageModel;
  return newState;
}

