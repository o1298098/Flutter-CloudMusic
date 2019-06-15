import 'dart:ui';

import 'package:cloudmusic/globalbasestate/state.dart';
import 'package:cloudmusic/views/discover_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../acountpage.dart';
import '../friendeventpage.dart';
import '../scrollvideopage.dart';
import '../userpage.dart';

class MainPageState implements GlobalBaseState<MainPageState> {
  List<Widget> pages = List<Widget>()
      ..add(DiscoverPage().buildPage(Map<String,String>()))
      ..add(ScrollVideoPage())
      ..add(UserPage())
      ..add(FrientEventPage())
      ..add(AcountPage());
  int selectedIndex = 0;
  @override
  MainPageState clone() {
    
    return MainPageState();
  }

  @override
  Color themeColor;
}

MainPageState initState(Map<String, dynamic> args) {

  return MainPageState();
}
