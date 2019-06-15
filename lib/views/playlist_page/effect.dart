import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayListPageState> buildEffect() {
  return combineEffects(<Object, Effect<PlayListPageState>>{
    PlayListPageAction.action: _onAction,
    Lifecycle.initState:_onInit
  });
}

void _onAction(Action action, Context<PlayListPageState> ctx) {
}
Future _onInit(Action action, Context<PlayListPageState> ctx) async {
  var r = await CloudMusicApiHelper.playListDetial(ctx.state.id);
    if (r.code == 200) {
        ctx.dispatch(PlayListPageActionCreator.onInit(r));
    }
}
