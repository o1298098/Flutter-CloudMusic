import 'package:cloudmusic/actions/Adapt.dart';
import 'package:flutter/material.dart';

class ScrollVideoPage extends StatefulWidget {
  @override
  ScrollPageState createState() => ScrollPageState();
}

class ScrollPageState extends State<ScrollVideoPage> with AutomaticKeepAliveClientMixin {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
        body: DefaultTabController(
      length: 6,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  title: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: Adapt.px(60),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.video_call,
                            ),
                            iconSize: Adapt.px(60),
                            color: Colors.grey[600],
                          ),
                        ),
                        new Expanded(
                            child: Container(
                          height: Adapt.px(80),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: Adapt.px(30)),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(text: '推荐'),
                      Tab(text: '视频广场'),
                      Tab(text: 'MV'),
                      Tab(text: '舞蹈'),
                      Tab(text: '翻唱'),
                      Tab(text: '舞蹈'),
                    ],
                  ),
                )),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            SafeArea(
                top: false,
                bottom: false,
                child: Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            Text(
                              count.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            FlatButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                })),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
