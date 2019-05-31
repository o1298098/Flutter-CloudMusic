import 'package:flutter/material.dart';
import 'package:cloudmusic/pages/discoverpage.dart';
import 'package:cloudmusic/pages/userpage.dart';
import 'package:cloudmusic/pages/acountpage.dart';
import 'package:cloudmusic/pages/scrollvideopage.dart';
import 'package:cloudmusic/pages/friendeventpage.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    theme: ThemeData(canvasColor: Colors.transparent,),
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatefulWidget {
  TutorialHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<TutorialHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      List<Widget> pages = List<Widget>();
  @override
  void initState() {
    pages
      ..add(DiscoverPage())
      ..add(ScrollVideoPage())
      ..add(UserPage())
      ..add(FrientEventPage())
      ..add(AcountPage());
      super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
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
            icon: Icon(Icons.person),
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
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}