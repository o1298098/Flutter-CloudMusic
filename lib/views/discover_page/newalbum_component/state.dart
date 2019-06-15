import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class NewAlbumState implements Cloneable<NewAlbumState> {

  NewAlbumModel newAlbumModel;

  @override
  NewAlbumState clone() {
    return NewAlbumState();
  }
}

NewAlbumState initState(Map<String, dynamic> args) {
  return NewAlbumState();
}

class PersonalizedConnector
    extends ConnOp<DiscoverPageState, NewAlbumState> {
  @override
  NewAlbumState get(DiscoverPageState state) {
    NewAlbumState newAlbumState = NewAlbumState();
    newAlbumState.newAlbumModel = state.pageModel.newAlbumModel;
    return newAlbumState;
  }
}
