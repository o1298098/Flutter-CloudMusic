import 'dart:convert' show json;

class FriendEventJsonstrModel {

  String msg;
  Song song;
  Video video;

  FriendEventJsonstrModel.fromParams({this.msg, this.song, this.video});

  factory FriendEventJsonstrModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new FriendEventJsonstrModel.fromJson(json.decode(jsonStr)) : new FriendEventJsonstrModel.fromJson(jsonStr);
  
  FriendEventJsonstrModel.fromJson(jsonRes) {
    msg = jsonRes['msg'];
    song = jsonRes['song'] == null ? null : new Song.fromJson(jsonRes['song']);
    video = jsonRes['video'] == null ? null : new Video.fromJson(jsonRes['video']);
  }

  @override
  String toString() {
    return '{"msg": ${msg != null?'${json.encode(msg)}':'null'},"song": $song}';
  }
}

class Song {

  Object audition;
  Object crbt;
  Object mp3Url;
  Object rtUrl;
  Object rurl;
  int copyright;
  int copyrightId;
  int dayPlays;
  int duration;
  int fee;
  int ftype;
  int hearTime;
  int id;
  int mvid;
  int no;
  int playedNum;
  int position;
  int rtype;
  int score;
  int starredNum;
  int status;
  double popularity;
  bool starred;
  String commentThreadId;
  String copyFrom;
  String disc;
  String name;
  String ringtone;
  List<dynamic> alias;
  List<Artists> artists;
  List<dynamic> rtUrls;
  Album album;
  BMusic bMusic;
  HMusic hMusic;
  IMusic lMusic;
  MMusic mMusic;

  Song.fromParams({this.audition, this.crbt, this.mp3Url, this.rtUrl, this.rurl, this.copyright, this.copyrightId, this.dayPlays, this.duration, this.fee, this.ftype, this.hearTime, this.id, this.mvid, this.no, this.playedNum, this.position, this.rtype, this.score, this.starredNum, this.status, this.popularity, this.starred, this.commentThreadId, this.copyFrom, this.disc, this.name, this.ringtone, this.alias, this.artists, this.rtUrls, this.album, this.bMusic, this.hMusic, this.lMusic, this.mMusic});
  
  Song.fromJson(jsonRes) {
    audition = jsonRes['audition'];
    crbt = jsonRes['crbt'];
    mp3Url = jsonRes['mp3Url'];
    rtUrl = jsonRes['rtUrl'];
    rurl = jsonRes['rurl'];
    copyright = jsonRes['copyright'];
    copyrightId = jsonRes['copyrightId'];
    dayPlays = jsonRes['dayPlays'];
    duration = jsonRes['duration'];
    fee = jsonRes['fee'];
    ftype = jsonRes['ftype'];
    hearTime = jsonRes['hearTime'];
    id = jsonRes['id'];
    mvid = jsonRes['mvid'];
    no = jsonRes['no'];
    playedNum = jsonRes['playedNum'];
    position = jsonRes['position'];
    rtype = jsonRes['rtype'];
    score = jsonRes['score'];
    starredNum = jsonRes['starredNum'];
    status = jsonRes['status'];
    popularity = jsonRes['popularity'];
    starred = jsonRes['starred'];
    commentThreadId = jsonRes['commentThreadId'];
    copyFrom = jsonRes['copyFrom'];
    disc = jsonRes['disc'];
    name = jsonRes['name'];
    ringtone = jsonRes['ringtone'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem);
    }

    artists = jsonRes['artists'] == null ? null : [];

    for (var artistsItem in artists == null ? [] : jsonRes['artists']){
            artists.add(artistsItem == null ? null : new Artists.fromJson(artistsItem));
    }

    rtUrls = jsonRes['rtUrls'] == null ? null : [];

    for (var rtUrlsItem in rtUrls == null ? [] : jsonRes['rtUrls']){
            rtUrls.add(rtUrlsItem);
    }

    album = jsonRes['album'] == null ? null : new Album.fromJson(jsonRes['album']);
    bMusic = jsonRes['bMusic'] == null ? null : new BMusic.fromJson(jsonRes['bMusic']);
    hMusic = jsonRes['hMusic'] == null ? null : new HMusic.fromJson(jsonRes['hMusic']);
    lMusic = jsonRes['lMusic'] == null ? null : new IMusic.fromJson(jsonRes['lMusic']);
    mMusic = jsonRes['mMusic'] == null ? null : new MMusic.fromJson(jsonRes['mMusic']);
  }

  @override
  String toString() {
    return '{"audition": $audition,"crbt": $crbt,"mp3Url": $mp3Url,"rtUrl": $rtUrl,"rurl": $rurl,"copyright": $copyright,"copyrightId": $copyrightId,"dayPlays": $dayPlays,"duration": $duration,"fee": $fee,"ftype": $ftype,"hearTime": $hearTime,"id": $id,"mvid": $mvid,"no": $no,"playedNum": $playedNum,"position": $position,"rtype": $rtype,"score": $score,"starredNum": $starredNum,"status": $status,"popularity": $popularity,"starred": $starred,"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"copyFrom": ${copyFrom != null?'${json.encode(copyFrom)}':'null'},"disc": ${disc != null?'${json.encode(disc)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"ringtone": ${ringtone != null?'${json.encode(ringtone)}':'null'},"alias": $alias,"artists": $artists,"rtUrls": $rtUrls,"album": $album,"bMusic": $bMusic,"hMusic": $hMusic,"lMusic": $lMusic,"mMusic": $mMusic}';
  }
}
class Video {

  Object description;
  Object threadId;
  Object urlInfo;
  int coverType;
  int duration;
  int durationms;
  int height;
  int playTime;
  int size;
  int state;
  int vid;
  int videoStatus;
  int width;
  String coverUrl;
  String title;
  String videoId;
  List<Resolution> resolutions;
  Creator creator;

  Video.fromParams({this.description, this.threadId, this.urlInfo, this.coverType, this.duration, this.durationms, this.height, this.playTime, this.size, this.state, this.vid, this.videoStatus, this.width, this.coverUrl, this.title, this.videoId, this.resolutions, this.creator});
  
  Video.fromJson(jsonRes) {
    description = jsonRes['description'];
    threadId = jsonRes['threadId'];
    urlInfo = jsonRes['urlInfo'];
    coverType = jsonRes['coverType'];
    duration = jsonRes['duration'];
    durationms = jsonRes['durationms'];
    height = jsonRes['height'];
    playTime = jsonRes['playTime'];
    size = jsonRes['size'];
    state = jsonRes['state'];
    vid = jsonRes['vid'];
    videoStatus = jsonRes['videoStatus'];
    width = jsonRes['width'];
    coverUrl = jsonRes['coverUrl'];
    title = jsonRes['title'];
    videoId = jsonRes['videoId'];
    resolutions = jsonRes['resolutions'] == null ? null : [];

    for (var resolutionsItem in resolutions == null ? [] : jsonRes['resolutions']){
            resolutions.add(resolutionsItem == null ? null : new Resolution.fromJson(resolutionsItem));
    }

    creator = jsonRes['creator'] == null ? null : new Creator.fromJson(jsonRes['creator']);
  }

  @override
  String toString() {
    return '{"description": $description,"threadId": $threadId,"urlInfo": $urlInfo,"coverType": $coverType,"duration": $duration,"durationms": $durationms,"height": $height,"playTime": $playTime,"size": $size,"state": $state,"vid": $vid,"videoStatus": $videoStatus,"width": $width,"coverUrl": ${coverUrl != null?'${json.encode(coverUrl)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"videoId": ${videoId != null?'${json.encode(videoId)}':'null'},"resolutions": $resolutions,"creator": $creator}';
  }
}
class Creator {

  Object expertTags;
  Object remarkName;
  int accountStatus;
  int authStatus;
  int authority;
  int avatarImgId;
  int backgroundImgId;
  int birthday;
  int city;
  int djStatus;
  int gender;
  int province;
  int userId;
  int userType;
  int vipType;
  bool defaultAvatar;
  bool followed;
  bool mutual;
  String avatarImgIdStr;
  String avatarImgId_str;
  String avatarUrl;
  String backgroundImgIdStr;
  String backgroundUrl;
  String description;
  String detailDescription;
  String nickname;
  String signature;
  Experts experts;

  Creator.fromParams({this.expertTags, this.remarkName, this.accountStatus, this.authStatus, this.authority, this.avatarImgId, this.backgroundImgId, this.birthday, this.city, this.djStatus, this.gender, this.province, this.userId, this.userType, this.vipType, this.defaultAvatar, this.followed, this.mutual, this.avatarImgIdStr, this.avatarImgId_str, this.avatarUrl, this.backgroundImgIdStr, this.backgroundUrl, this.description, this.detailDescription, this.nickname, this.signature, this.experts});
  
  Creator.fromJson(jsonRes) {
    expertTags = jsonRes['expertTags'];
    remarkName = jsonRes['remarkName'];
    accountStatus = jsonRes['accountStatus'];
    authStatus = jsonRes['authStatus'];
    authority = jsonRes['authority'];
    avatarImgId = jsonRes['avatarImgId'];
    backgroundImgId = jsonRes['backgroundImgId'];
    birthday = jsonRes['birthday'];
    city = jsonRes['city'];
    djStatus = jsonRes['djStatus'];
    gender = jsonRes['gender'];
    province = jsonRes['province'];
    userId = jsonRes['userId'];
    userType = jsonRes['userType'];
    vipType = jsonRes['vipType'];
    defaultAvatar = jsonRes['defaultAvatar'];
    followed = jsonRes['followed'];
    mutual = jsonRes['mutual'];
    avatarImgIdStr = jsonRes['avatarImgIdStr'];
    avatarImgId_str = jsonRes['avatarImgId_str'];
    avatarUrl = jsonRes['avatarUrl'];
    backgroundImgIdStr = jsonRes['backgroundImgIdStr'];
    backgroundUrl = jsonRes['backgroundUrl'];
    description = jsonRes['description'];
    detailDescription = jsonRes['detailDescription'];
    nickname = jsonRes['nickname'];
    signature = jsonRes['signature'];
    experts = jsonRes['experts'] == null ? null : new Experts.fromJson(jsonRes['experts']);
  }

  @override
  String toString() {
    return '{"expertTags": $expertTags,"remarkName": $remarkName,"accountStatus": $accountStatus,"authStatus": $authStatus,"authority": $authority,"avatarImgId": $avatarImgId,"backgroundImgId": $backgroundImgId,"birthday": $birthday,"city": $city,"djStatus": $djStatus,"gender": $gender,"province": $province,"userId": $userId,"userType": $userType,"vipType": $vipType,"defaultAvatar": $defaultAvatar,"followed": $followed,"mutual": $mutual,"avatarImgIdStr": ${avatarImgIdStr != null?'${json.encode(avatarImgIdStr)}':'null'},"avatarImgId_str": ${avatarImgId_str != null?'${json.encode(avatarImgId_str)}':'null'},"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"backgroundImgIdStr": ${backgroundImgIdStr != null?'${json.encode(backgroundImgIdStr)}':'null'},"backgroundUrl": ${backgroundUrl != null?'${json.encode(backgroundUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"detailDescription": ${detailDescription != null?'${json.encode(detailDescription)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'},"signature": ${signature != null?'${json.encode(signature)}':'null'},"experts": $experts}';
  }
}

class Experts {

  String one;
  String two;

  Experts.fromParams({this.one, this.two});
  
  Experts.fromJson(jsonRes) {
    one= jsonRes['1'];
    two = jsonRes['2'];
  }

  @override
  String toString() {
    return '{"1": ${1 != null?'${json.encode(one)}':'null'},"2": ${2 != null?'${json.encode(two)}':'null'}}';
  }
}

class Resolution {

  int resolution;
  int size;

  Resolution.fromParams({this.resolution, this.size});
  
  Resolution.fromJson(jsonRes) {
    resolution = jsonRes['resolution'];
    size = jsonRes['size'];
  }

  @override
  String toString() {
    return '{"resolution": $resolution,"size": $size}';
  }
}
class MMusic {

  int bitrate;
  int dfsId;
  int id;
  int playTime;
  int size;
  int sr;
  double volumeDelta;
  String extension;
  String name;

  MMusic.fromParams({this.bitrate, this.dfsId, this.id, this.playTime, this.size, this.sr, this.volumeDelta, this.extension, this.name});
  
  MMusic.fromJson(jsonRes) {
    bitrate = jsonRes['bitrate'];
    dfsId = jsonRes['dfsId'];
    id = jsonRes['id'];
    playTime = jsonRes['playTime'];
    size = jsonRes['size'];
    sr = jsonRes['sr'];
    volumeDelta = jsonRes['volumeDelta'];
    extension = jsonRes['extension'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"bitrate": $bitrate,"dfsId": $dfsId,"id": $id,"playTime": $playTime,"size": $size,"sr": $sr,"volumeDelta": $volumeDelta,"extension": ${extension != null?'${json.encode(extension)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class IMusic {

  int bitrate;
  int dfsId;
  int id;
  int playTime;
  int size;
  int sr;
  double volumeDelta;
  String extension;
  String name;

  IMusic.fromParams({this.bitrate, this.dfsId, this.id, this.playTime, this.size, this.sr, this.volumeDelta, this.extension, this.name});
  
  IMusic.fromJson(jsonRes) {
    bitrate = jsonRes['bitrate'];
    dfsId = jsonRes['dfsId'];
    id = jsonRes['id'];
    playTime = jsonRes['playTime'];
    size = jsonRes['size'];
    sr = jsonRes['sr'];
    volumeDelta = jsonRes['volumeDelta'];
    extension = jsonRes['extension'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"bitrate": $bitrate,"dfsId": $dfsId,"id": $id,"playTime": $playTime,"size": $size,"sr": $sr,"volumeDelta": $volumeDelta,"extension": ${extension != null?'${json.encode(extension)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class HMusic {

  int bitrate;
  int dfsId;
  int id;
  int playTime;
  int size;
  int sr;
  double volumeDelta;
  String extension;
  String name;

  HMusic.fromParams({this.bitrate, this.dfsId, this.id, this.playTime, this.size, this.sr, this.volumeDelta, this.extension, this.name});
  
  HMusic.fromJson(jsonRes) {
    bitrate = jsonRes['bitrate'];
    dfsId = jsonRes['dfsId'];
    id = jsonRes['id'];
    playTime = jsonRes['playTime'];
    size = jsonRes['size'];
    sr = jsonRes['sr'];
    volumeDelta = jsonRes['volumeDelta'];
    extension = jsonRes['extension'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"bitrate": $bitrate,"dfsId": $dfsId,"id": $id,"playTime": $playTime,"size": $size,"sr": $sr,"volumeDelta": $volumeDelta,"extension": ${extension != null?'${json.encode(extension)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class BMusic {

  int bitrate;
  int dfsId;
  int id;
  int playTime;
  int size;
  int sr;
  double volumeDelta;
  String extension;
  String name;

  BMusic.fromParams({this.bitrate, this.dfsId, this.id, this.playTime, this.size, this.sr, this.volumeDelta, this.extension, this.name});
  
  BMusic.fromJson(jsonRes) {
    bitrate = jsonRes['bitrate'];
    dfsId = jsonRes['dfsId'];
    id = jsonRes['id'];
    playTime = jsonRes['playTime'];
    size = jsonRes['size'];
    sr = jsonRes['sr'];
    volumeDelta = jsonRes['volumeDelta'];
    extension = jsonRes['extension'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"bitrate": $bitrate,"dfsId": $dfsId,"id": $id,"playTime": $playTime,"size": $size,"sr": $sr,"volumeDelta": $volumeDelta,"extension": ${extension != null?'${json.encode(extension)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class Album {

  int companyId;
  int copyrightId;
  int id;
  int pic;
  int picId;
  int publishTime;
  int size;
  int status;
  String blurPicUrl;
  String briefDesc;
  String commentThreadId;
  String company;
  String description;
  String img80x80;
  String name;
  String picUrl;
  String tags;
  String type;
  List<dynamic> alias;
  List<Artist> artists;
  List<dynamic> songs;
  Artist artist;

  Album.fromParams({this.companyId, this.copyrightId, this.id, this.pic, this.picId, this.publishTime, this.size, this.status, this.blurPicUrl, this.briefDesc, this.commentThreadId, this.company, this.description, this.img80x80, this.name, this.picUrl, this.tags, this.type, this.alias, this.artists, this.songs, this.artist});
  
  Album.fromJson(jsonRes) {
    companyId = jsonRes['companyId'];
    copyrightId = jsonRes['copyrightId'];
    id = jsonRes['id'];
    pic = jsonRes['pic'];
    picId = jsonRes['picId'];
    publishTime = jsonRes['publishTime'];
    size = jsonRes['size'];
    status = jsonRes['status'];
    blurPicUrl = jsonRes['blurPicUrl'];
    briefDesc = jsonRes['briefDesc'];
    commentThreadId = jsonRes['commentThreadId'];
    company = jsonRes['company'];
    description = jsonRes['description'];
    img80x80 = jsonRes['img80x80'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    tags = jsonRes['tags'];
    type = jsonRes['type'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem);
    }

    artists = jsonRes['artists'] == null ? null : [];

    for (var artistsItem in artists == null ? [] : jsonRes['artists']){
            artists.add(artistsItem == null ? null : new Artist.fromJson(artistsItem));
    }

    songs = jsonRes['songs'] == null ? null : [];

    for (var songsItem in songs == null ? [] : jsonRes['songs']){
            songs.add(songsItem);
    }

    artist = jsonRes['artist'] == null ? null : new Artist.fromJson(jsonRes['artist']);
  }

  @override
  String toString() {
    return '{"companyId": ${company != null?'${json.encode(company)}':'null'}Id,"copyrightId": $copyrightId,"id": $id,"pic": $pic,"picId": $picId,"publishTime": $publishTime,"size": $size,"status": $status,"blurPicUrl": ${blurPicUrl != null?'${json.encode(blurPicUrl)}':'null'},"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"company": ${company != null?'${json.encode(company)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"img80x80": ${img80x80 != null?'${json.encode(img80x80)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"tags": ${tags != null?'${json.encode(tags)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'},"alias": $alias,"artists": $artists,"songs": $songs,"artist": $artist}';
  }
}

class Artist {

  int albumSize;
  int id;
  int img1v1Id;
  int musicSize;
  int picId;
  String briefDesc;
  String img1v1Url;
  String name;
  String picUrl;
  String trans;
  List<BMusic> alias;

  Artist.fromParams({this.albumSize, this.id, this.img1v1Id, this.musicSize, this.picId, this.briefDesc, this.img1v1Url, this.name, this.picUrl, this.trans, this.alias});
  
  Artist.fromJson(jsonRes) {
    albumSize = jsonRes['albumSize'];
    id = jsonRes['id'];
    img1v1Id = jsonRes['img1v1Id'];
    musicSize = jsonRes['musicSize'];
    picId = jsonRes['picId'];
    briefDesc = jsonRes['briefDesc'];
    img1v1Url = jsonRes['img1v1Url'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    trans = jsonRes['trans'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem == null ? null : new BMusic.fromJson(aliasItem));
    }
  }

  @override
  String toString() {
    return '{"albumSize": $albumSize,"id": $id,"img1v1Id": $img1v1Id,"musicSize": $musicSize,"picId": $picId,"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"img1v1Url": ${img1v1Url != null?'${json.encode(img1v1Url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"trans": ${trans != null?'${json.encode(trans)}':'null'},"alias": $alias}';
  }
}
class Artists {

  int albumSize;
  int id;
  int img1v1Id;
  int musicSize;
  int picId;
  String briefDesc;
  String img1v1Url;
  String name;
  String picUrl;
  String trans;
  List<List<dynamic>> alias;

  Artists.fromParams({this.albumSize, this.id, this.img1v1Id, this.musicSize, this.picId, this.briefDesc, this.img1v1Url, this.name, this.picUrl, this.trans, this.alias});
  
  Artists.fromJson(jsonRes) {
    albumSize = jsonRes['albumSize'];
    id = jsonRes['id'];
    img1v1Id = jsonRes['img1v1Id'];
    musicSize = jsonRes['musicSize'];
    picId = jsonRes['picId'];
    briefDesc = jsonRes['briefDesc'];
    img1v1Url = jsonRes['img1v1Url'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    trans = jsonRes['trans'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){      
  List<dynamic> aliasChild = aliasItem == null ? null : [];
    for (var aliasItemItem in aliasChild == null ? [] : aliasItem){
            aliasChild.add(aliasItemItem);
    }
      alias.add(aliasChild);
    }
  }

  @override
  String toString() {
    return '{"albumSize": $albumSize,"id": $id,"img1v1Id": $img1v1Id,"musicSize": $musicSize,"picId": $picId,"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"img1v1Url": ${img1v1Url != null?'${json.encode(img1v1Url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"trans": ${trans != null?'${json.encode(trans)}':'null'},"alias": $alias}';
  }
}

