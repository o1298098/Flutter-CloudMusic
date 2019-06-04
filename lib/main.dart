import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/views/homepage.dart';
import 'package:cloudmusic/views/StartPage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
Future main() async {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    theme: ThemeData(
      canvasColor: Colors.transparent,
      primaryColor: Color.fromRGBO(235,77, 68, 1),),
    home:await getStartPage(),
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new TutorialHome(),
      '/start': (BuildContext context) => new StartPage()
    },
  ));
}
Future<Widget> getStartPage()
async{
  await CloudMusicApiHelper.getCookieDir();
  String appDocPath=CloudMusicApiHelper.appDocPath;
  var cookiejar=new PersistCookieJar(dir:"$appDocPath/cookies");
  var cookies= cookiejar.loadForRequest(Uri.parse('https://music.aityp.com'));
  if(cookies.length>0)
  {
    return TutorialHome();
  }
  else
  {
    return StartPage();
  }
}
