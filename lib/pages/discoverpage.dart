import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudmusic/actions/counTostr.dart';
import 'package:cloudmusic/pages/playlistpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/model/model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloudmusic/actions/Adapt.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height)
      ..init(context);
    List<CircleInfo> images = new List<CircleInfo>()
      ..add(new CircleInfo('images/ic_calendar.png', '每日推荐'))
      ..add(new CircleInfo('images/ic_mainmusic.png', '歌单'))
      ..add(new CircleInfo('images/ic_3bar.png', '排行榜'))
      ..add(new CircleInfo('images/ic_mainradio.png', '电台'))
      ..add(new CircleInfo('images/ic_mainrman.png', '直播'));
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
                            images[0].url,
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
                  images[0].name,
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
                        images[1].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  images[1].name,
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
                        images[2].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  images[2].name,
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
                        images[3].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  images[3].name,
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
                        images[4].url,
                        width: 25,
                        height: 25,
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(235, 77, 68, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(25.0)))),
                new Text(
                  images[4].name,
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
          delegate: _SliverAppBarDelegate(
            minHeight: 100,
            maxHeight: 100,
            child: searchGroup,
          ),
        ),
        SliverToBoxAdapter(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Imageview(),
            circleButtonGroup,
            personizedTitle,
            new PersonalizedGroup(),
            newSongsTitle,
            new NewAlbumGroup()
          ],
        )),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CircleInfo {
  String url;
  String name;
  CircleInfo(this.url, this.name);
}

class Imageview extends StatefulWidget {
  @override
  ImageviewState createState() => ImageviewState();
}

class ImageviewState extends State<Imageview> {
  String url =
      'https://www.lodderoofing.com/wp-content/uploads/2018/04/grass-tips-wind-grey-sky.jpg';
  BannerModel s;
  @override
  void initState() {
    getBanner();
    super.initState();
  }

  void getBanner() async {
    var r = await CloudMusicApiHelper.getBanners();
    if (r.code == 200) {
      setState(() {
        s = r;
      });
    }
  }

  Widget getImage(int index) {
    if (s != null) {
      return new Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: new ClipRRect(
            child: CachedNetworkImage(
              placeholder: (context, url) => new Container(
                    color: Colors.grey[400],
                  ),
              imageUrl: s.banners[index].imageUrl,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
      );
    } else {
      return new ClipRRect(
          child: CachedNetworkImage(
            placeholder: (context, url) => new Container(
                  color: Colors.grey[400],
                ),
            imageUrl: url,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: Adapt.px(250),
      margin: EdgeInsets.only(bottom: 15),
      child: new Swiper(
          viewportFraction: 0.9999,
          autoplay: true,
          loop: true,
          pagination: new SwiperPagination(),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return getImage(index);
          }),
    );
  }
}

class PersonalizedGroup extends StatefulWidget {
  @override
  PersonalizedGroupState createState() => PersonalizedGroupState();
}

class PersonalizedGroupState extends State<PersonalizedGroup> {
  List<Widget> items = new List<Widget>();
  void fillItem() async {
    var s = await CloudMusicApiHelper.getPersonalized(6);
    if (s.code == 200) {
      var b = new List<Widget>.generate(
          s.result.length,
          (int index) => new GestureDetector(
              onTap: () async {
                await Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new PlayListPage(id: s.result[index].id);
                }));
              },
              child: new Container(
                  child: new Column(
                children: [
                  Stack(children: <Widget>[
                    new ClipRRect(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => new Container(
                                color: Colors.grey[400],
                              ),
                          imageUrl: s.result[index].picUrl,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      width: 150,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(CountTostr.chage(s.result[index].playCount),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ]),
                  new Text(
                    s.result[index].name,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(12)),
                  )
                ],
              ))));
      setState(() {
        items = b;
      });
    }
  }

  @override
  void initState() {
    fillItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: new GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        semanticChildCount: 6,
        childAspectRatio: 5 / 7,
        padding: const EdgeInsets.all(4.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: items,
        shrinkWrap: true,
      ),
    );
  }
}

class NewAlbumGroup extends StatefulWidget {
  @override
  NewAlbumGroupState createState() => NewAlbumGroupState();
}

class NewAlbumGroupState extends State<NewAlbumGroup> {
  List<Container> items = new List<Container>();
  void fillItem() async {
    var s = await CloudMusicApiHelper.getNewAlbums(3, 0);
    if (s.code == 200) {
      var b = new List<Container>.generate(
          s.albums.length,
          (int index) => new Container(
                  child: new Column(
                children: [
                  new ClipRRect(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => new Container(
                              color: Colors.grey[400],
                            ),
                        imageUrl: s.albums[index].picUrl,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  new Text(
                    s.albums[index].name,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    softWrap: true,
                  )
                ],
              )));
      setState(() {
        items = b;
      });
    }
  }

  @override
  void initState() {
    fillItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: new GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        semanticChildCount: 3,
        childAspectRatio: 5 / 7,
        padding: const EdgeInsets.all(4.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: items,
        shrinkWrap: true,
      ),
    );
  }
}
