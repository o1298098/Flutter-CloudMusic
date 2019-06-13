import 'dart:ui';

import 'package:cloudmusic/globalbasestate/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ArtistDetailState implements GlobalBaseState<ArtistDetailState> {

  @override
  ArtistDetailState clone() {
    return ArtistDetailState();
  }

  @override
  Color themeColor;
}

ArtistDetailState initState(Map<String, dynamic> args) {
  return ArtistDetailState();
}
