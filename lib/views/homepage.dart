import 'package:cloudmusic/actions/timeline.dart';
import 'package:cloudmusic/views/startpage.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/views/discoverpage.dart';
import 'package:cloudmusic/views/userpage.dart';
import 'package:cloudmusic/views/acountpage.dart';
import 'package:cloudmusic/views/scrollvideopage.dart';
import 'package:cloudmusic/views/friendeventpage.dart';

class TutorialHome extends StatefulWidget {
  TutorialHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<TutorialHome> {
  final pageController = PageController();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      List<Widget> pages = List<Widget>();
  @override
  void initState() {
    setLocaleInfo('zh_cloudmusic', CloudMusicTimelineInfoCN());
    pages
      ..add(DiscoverPage())
      ..add(ScrollVideoPage())
      ..add(UserPage())
      ..add(FrientEventPage())
      ..add(AcountPage());
      super.initState();
  }
  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children:pages,
        controller: pageController,
        onPageChanged: onPageChanged,
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(235,77, 68, 1),
        unselectedItemColor: Colors.grey,        
        onTap: (int index) {
          pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}