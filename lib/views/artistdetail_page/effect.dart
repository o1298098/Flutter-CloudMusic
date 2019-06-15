import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ArtistDetailState> buildEffect() {
  return combineEffects(<Object, Effect<ArtistDetailState>>{
    artistdetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ArtistDetailState> ctx) {
}
