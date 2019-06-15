import 'package:cloudmusic/views/customwidgets/keepalivewidget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainPageState state, Dispatch dispatch, ViewService viewService) {
  final pageController = PageController();

  Widget _buildPage(Widget page)
  {
    return KeepAliveWidget(page);
  }

  return Scaffold(
      backgroundColor: Colors.white,
      body:PageView(
        children:state.pages.map(_buildPage).toList(),
        controller: pageController,
        onPageChanged: (int i) => dispatch(MainPageActionCreator.onPageTapAction(i)),
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('视频'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('我的'),
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('朋友'),
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('账号'),
          ),
        ],
        currentIndex: state.selectedIndex,
        selectedItemColor: Color.fromRGBO(235,77, 68, 1),
        unselectedItemColor: Colors.grey,        
        onTap: (int index) {
          pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
}

