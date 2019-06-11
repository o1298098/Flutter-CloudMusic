import 'dart:convert' show json;
import 'dart:io';
import 'package:cloudmusic/models/enum/commentliketype.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloudMusicApiHelper {
  static const String _apihost = 'https://music.aityp.com';
  static String appDocPath;
  static CookieJar cj;
  static Future<void> getCookieDir() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDocPath = appDocDir.path;
    cj = new PersistCookieJar(dir: "$appDocPath/cookies");
  }

  static Future<bool> login(String phone, String pwd) async {
    String params = '/login/cellphone?phone=$phone&password=$pwd';
    var str = await httpGet(params);
    if (str == null) {
      return false;
    } else {
      var r = AccountInfo(str);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', r.profile.nickname);
      prefs.setInt('userId', r.account.id);
      prefs.setInt('userVipType', r.profile.vipType);
      prefs.setString('usericon', r.profile.avatarUrl);
    }
    return true;
  }

  static Future<AccountDetailModel> accountDetal(int uid) async {
    String param = "/user/detail?uid=$uid";
    var str = await httpGet(param);
    return new AccountDetailModel(str);
  }

  static Future<BannerModel> getBanners() async {
    String param = "/banner";
    var str = await httpGet(param);
    return new BannerModel(str);
  }

  static Future<PersonalizedModel> getPersonalized(int limit) async {
    String param = '/personalized?limit=$limit';
    var str = await httpGet(param);
    return new PersonalizedModel(str);
  }

  static Future<NewAlbumModel> getNewAlbums(int limit, int offset) async {
    String param = '/top/album?offset=$offset&limit=$limit';
    var str = await httpGet(param);
    return NewAlbumModel(str);
  }

  static Future<MusicPlayList> playListDetial(int id) async {
    String param = '/playlist/detail?id=$id';
    var str = await httpGet(param);
    return MusicPlayList(str);
  }

  static Future<VideoGroupMpdel> getVideo(int id, int limit, int offset) async {
    String param = '/video/group?id=$id&limit=$limit&offset=$offset';
    var str = await httpGet(param);
    return VideoGroupMpdel(str);
  }

  static Future<SongCommentModel> songComments(
      int id, int limit, int offset) async {
    String param = '/comment/music?id=$id&limit=$limit&offset=$offset';
    var str = await httpGet(param);
    return SongCommentModel(str);
  }

  static Future<SongCommentModel> videoComments(
      String id, int limit, int offset) async {
    String param = '/comment/video?id=$id&limit=$limit&offset=$offset';
    var str = await httpGet(param);
    return SongCommentModel(str);
  }

  static Future<void> clickLike(
      int id, int cid, bool like, CommentLikeType type) async {
    String t = like ? '1' : '0';
    String param =
        '/comment/like?id=$id&cid=$cid&$t=1&type=' + type.index.toString();
    await httpGet(param);
  }

  static Future<VideoDetialInfoModel> videoDetail(String vid) async {
    String param = '/video/detail?id=$vid';
    var str = await httpGet(param);
    return VideoDetialInfoModel(str);
  }

  static Future<VideoUrlModel> videoUrl(String vid) async {
    String param = '/video/url?id=$vid';
    var str = await httpGet(param);
    return VideoUrlModel(str);
  }

  static Future<SimilarVideoModel> similarVideo(String vid) async {
    String param = '/related/allvideo?id=$vid';
    var str = await httpGet(param);
    return SimilarVideoModel(str);
  }

  static Future<PlayListModel> userPlayLIst(int uid) async {
    String param = '/user/playlist?uid=$uid';
    var str = await httpGet(param);
    return PlayListModel(str);
  }

  static Future<FriendEventModel> userFriendEvent(
      int pagesize, int lasttime) async {
    String param = '/event?pagesize=$pagesize&lasttime=$lasttime';
    var str = await httpGet(param);
    return FriendEventModel(str);
  }

  static Future<String> httpGet(String params) async {
    try {
      if (appDocPath == null) {
        await getCookieDir();
      }
      var dio = new Dio();
      dio.cookieJar = cj;
      var response = await dio.get(_apihost + params);
      var _content = json.encode(response.data);
      return _content;
    } on DioError catch (e) {
      return null;
    }
  }
}
