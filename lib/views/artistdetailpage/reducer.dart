import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArtistDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArtistDetailState>>{
      artistdetailAction.action: _onAction,
    },
  );
}

ArtistDetailState _onAction(ArtistDetailState state, Action action) {
  final ArtistDetailState newState = state.clone();
  return newState;
}
