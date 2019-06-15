import 'dart:ui';

import 'package:cloudmusic/globalbasestate/state.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/models/pagemodel/discoverpagemodel.dart';
import 'package:fish_redux/fish_redux.dart';

import 'imageswiper_component/state.dart';

class DiscoverPageState implements GlobalBaseState<DiscoverPageState> {

 List<CircleInfo> images = new List<CircleInfo>()
      ..add(new CircleInfo('images/ic_calendar.png', '每日推荐'))
      ..add(new CircleInfo('images/ic_mainmusic.png', '歌单'))
      ..add(new CircleInfo('images/ic_3bar.png', '排行榜'))
      ..add(new CircleInfo('images/ic_mainradio.png', '电台'))
      ..add(new CircleInfo('images/ic_mainrman.png', '直播'));
  DiscoverPageModel pageModel=new DiscoverPageModel();
  @override
  DiscoverPageState clone() {
    return DiscoverPageState();
  }

  @override
  Color themeColor;
}

DiscoverPageState initState(Map<String, dynamic> args) {
  return DiscoverPageState();
}



class CircleInfo {
  String url;
  String name;
  CircleInfo(this.url, this.name);
}
