import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/views/customwidgets/sliverappbardelegate.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'imageswiper_component/component.dart';
import 'state.dart';

Widget buildView(DiscoverPageState state, Dispatch dispatch, ViewService viewService) {
   
    var circleButtonGroup = new Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: 50,
                    child: new Stack(
                      children: <Widget>[
                        new Center(
                          child: Image.asset(
                            state.images[0].url,
                            width: 25,
                            height: 25,
                          ),
                        ),
                        new Align(
                            alignment: Alignment(0, 0.2),
                            child: Text(DateTime.now().day.toString(),
                                style: TextStyle(
                                    color: Color.fromRGBO(235, 77, 68, 1))))
                      ],
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  state.images[0].name,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: 50,
                    child: new Center(
                      child: Image.asset(
                        state.images[1].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  state.images[1].name,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: 50,
                    child: new Center(
                      child: Image.asset(
                        state.images[2].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  state.images[2].name,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: 50,
                    child: new Center(
                      child: Image.asset(
                        state.images[3].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  state.images[3].name,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: 50,
                    child: new Center(
                      child: Image.asset(
                        state.images[4].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  state.images[4].name,
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          ],
        ));

    var searchGroup = new Container(
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 45, bottom: 10, left: 15.0, right: 15),
        height: 40,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset('images/ic_mic_b.png', width: 30, height: 30),
            new Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[200]),
              child: new Center(
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey[400],
                    ),
                    Text(
                      '出前一丁',
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
            ))
          ],
        ));
    var personizedTitle = new Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('推荐歌单',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          ButtonTheme(
              height: 25.0,
              minWidth: 60,
              child: OutlineButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(1),
                color: Colors.white,
                onPressed: () {},
                child: Text(
                  '歌单广场',
                  style: TextStyle(fontSize: Adapt.px(20)),
                ),
                textColor: Colors.black87,
              ))
        ],
      ),
    );
    var newSongsTitle = new Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('新碟',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          ButtonTheme(
              minWidth: 60.0,
              height: 25.0,
              child: OutlineButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(1),
                color: Colors.white,
                onPressed: () {},
                child: Text(
                  '更多新碟',
                  style: TextStyle(fontSize: Adapt.px(20)),
                ),
                textColor: Colors.black87,
              ))
        ],
      ),
    );
    return new CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            minHeight: 100,
            maxHeight: 100,
            child: searchGroup,
          ),
        ),
        SliverToBoxAdapter(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            viewService.buildComponent('imageswiper'),
            circleButtonGroup,
            personizedTitle,
            viewService.buildComponent('personalized'),
            newSongsTitle,
            viewService.buildComponent('newalbum'),
          ],
        )),
      ],
    );
}
