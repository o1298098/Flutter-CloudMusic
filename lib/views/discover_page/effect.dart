import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/models/pagemodel/discoverpagemodel.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiscoverPageState> buildEffect() {
  return combineEffects(<Object, Effect<DiscoverPageState>>{
    DiscoverPageAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<DiscoverPageState> ctx) {}

void _onInit(Action action, Context<DiscoverPageState> ctx) async {
  DiscoverPageModel s = new DiscoverPageModel();
  var r = await CloudMusicApiHelper.getBanners();
  if (r.code == 200) s.bannerModel = r;
  var p = await CloudMusicApiHelper.getPersonalized(6);
  if (p.code == 200) s.personalizedModel = p;
  var k = await CloudMusicApiHelper.getNewAlbums(3, 0);
  if (k.code == 200) s.newAlbumModel = k;
  ctx.dispatch(DiscoverPageActionCreator.onInit(s));
}
