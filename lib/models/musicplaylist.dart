part of model;

class MusicPlayList {

  int code;
  List<Priviliege> privileges;
  PlayList playlist;

  MusicPlayList.fromParams({this.code, this.privileges, this.playlist});

  factory MusicPlayList(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MusicPlayList.fromJson(json.decode(jsonStr)) : new MusicPlayList.fromJson(jsonStr);
  
  MusicPlayList.fromJson(jsonRes) {
    code = jsonRes['code'];
    privileges = jsonRes['privileges'] == null ? null : [];

    for (var privilegesItem in privileges == null ? [] : jsonRes['privileges']){
            privileges.add(privilegesItem == null ? null : new Priviliege.fromJson(privilegesItem));
    }

    playlist = jsonRes['playlist'] == null ? null : new PlayList.fromJson(jsonRes['playlist']);
  }

  @override
  String toString() {
    return '{"code": $code,"privileges": $privileges,"playlist": $playlist}';
  }
}

class PlayList {

  Object description;
  int adType;
  int cloudTrackCount;
  int commentCount;
  int coverImgId;
  int createTime;
  int id;
  int playCount;
  int privacy;
  int shareCount;
  int specialType;
  int status;
  int subscribedCount;
  int trackCount;
  int trackNumberUpdateTime;
  int trackUpdateTime;
  int updateTime;
  int userId;
  bool highQuality;
  bool newImported;
  bool ordered;
  bool subscribed;
  String commentThreadId;
  String coverImgId_str;
  String coverImgUrl;
  String name;
  List<dynamic> subscribers;
  List<dynamic> tags;
  List<TrackId> trackIds;
  List<Track> tracks;
  Creator creator;

  PlayList.fromParams({this.description, this.adType, this.cloudTrackCount, this.commentCount, this.coverImgId, this.createTime, this.id, this.playCount, this.privacy, this.shareCount, this.specialType, this.status, this.subscribedCount, this.trackCount, this.trackNumberUpdateTime, this.trackUpdateTime, this.updateTime, this.userId, this.highQuality, this.newImported, this.ordered, this.subscribed, this.commentThreadId, this.coverImgId_str, this.coverImgUrl, this.name, this.subscribers, this.tags, this.trackIds, this.tracks, this.creator});
  
  PlayList.fromJson(jsonRes) {
    description = jsonRes['description'];
    adType = jsonRes['adType'];
    cloudTrackCount = jsonRes['cloudTrackCount'];
    commentCount = jsonRes['commentCount'];
    coverImgId = jsonRes['coverImgId'];
    createTime = jsonRes['createTime'];
    id = jsonRes['id'];
    playCount = jsonRes['playCount'];
    privacy = jsonRes['privacy'];
    shareCount = jsonRes['shareCount'];
    specialType = jsonRes['specialType'];
    status = jsonRes['status'];
    subscribedCount = jsonRes['subscribedCount'];
    trackCount = jsonRes['trackCount'];
    trackNumberUpdateTime = jsonRes['trackNumberUpdateTime'];
    trackUpdateTime = jsonRes['trackUpdateTime'];
    updateTime = jsonRes['updateTime'];
    userId = jsonRes['userId'];
    highQuality = jsonRes['highQuality'];
    newImported = jsonRes['newImported'];
    ordered = jsonRes['ordered'];
    subscribed = jsonRes['subscribed'];
    commentThreadId = jsonRes['commentThreadId'];
    coverImgId_str = jsonRes['coverImgId_str'];
    coverImgUrl = jsonRes['coverImgUrl'];
    name = jsonRes['name'];
    subscribers = jsonRes['subscribers'] == null ? null : [];

    for (var subscribersItem in subscribers == null ? [] : jsonRes['subscribers']){
            subscribers.add(subscribersItem);
    }

    tags = jsonRes['tags'] == null ? null : [];

    for (var tagsItem in tags == null ? [] : jsonRes['tags']){
            tags.add(tagsItem);
    }

    trackIds = jsonRes['trackIds'] == null ? null : [];

    for (var trackIdsItem in trackIds == null ? [] : jsonRes['trackIds']){
            trackIds.add(trackIdsItem == null ? null : new TrackId.fromJson(trackIdsItem));
    }

    tracks = jsonRes['tracks'] == null ? null : [];

    for (var tracksItem in tracks == null ? [] : jsonRes['tracks']){
            tracks.add(tracksItem == null ? null : new Track.fromJson(tracksItem));
    }

    creator = jsonRes['creator'] == null ? null : new Creator.fromJson(jsonRes['creator']);
  }

  @override
  String toString() {
    return '{"description": $description,"adType": $adType,"cloudTrackCount": $cloudTrackCount,"commentCount": $commentCount,"coverImgId": $coverImgId,"createTime": $createTime,"id": $id,"playCount": $playCount,"privacy": $privacy,"shareCount": $shareCount,"specialType": $specialType,"status": $status,"subscribedCount": $subscribedCount,"trackCount": $trackCount,"trackNumberUpdateTime": $trackNumberUpdateTime,"trackUpdateTime": $trackUpdateTime,"updateTime": $updateTime,"userId": $userId,"highQuality": $highQuality,"newImported": $newImported,"ordered": $ordered,"subscribed": $subscribed,"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"coverImgId_str": ${coverImgId_str != null?'${json.encode(coverImgId_str)}':'null'},"coverImgUrl": ${coverImgUrl != null?'${json.encode(coverImgUrl)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"subscribers": $subscribers,"tags": $tags,"trackIds": $trackIds,"tracks": $tracks,"creator": $creator}';
  }
}

class Creator {

  Object expertTags;
  Object experts;
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
  String avatarUrl;
  String backgroundImgIdStr;
  String backgroundUrl;
  String description;
  String detailDescription;
  String nickname;
  String signature;
  String userName;

  Creator.fromParams({this.expertTags, this.userName, this.experts, this.remarkName, this.accountStatus, this.authStatus, this.authority, this.avatarImgId, this.backgroundImgId, this.birthday, this.city, this.djStatus, this.gender, this.province, this.userId, this.userType, this.vipType, this.defaultAvatar, this.followed, this.mutual, this.avatarImgIdStr, this.avatarUrl, this.backgroundImgIdStr, this.backgroundUrl, this.description, this.detailDescription, this.nickname, this.signature});
  
  Creator.fromJson(jsonRes) {
    expertTags = jsonRes['expertTags'];
    userName = jsonRes['userName'];
    experts = jsonRes['experts'];
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
    avatarUrl = jsonRes['avatarUrl'];
    backgroundImgIdStr = jsonRes['backgroundImgIdStr'];
    backgroundUrl = jsonRes['backgroundUrl'];
    description = jsonRes['description'];
    detailDescription = jsonRes['detailDescription'];
    nickname = jsonRes['nickname'];
    signature = jsonRes['signature'];
  }

  @override
  String toString() {
    return '{"expertTags": $expertTags,"userName": ${userName != null?'${json.encode(userName)}':'null'},"experts": $experts,"remarkName": $remarkName,"accountStatus": $accountStatus,"authStatus": $authStatus,"authority": $authority,"avatarImgId": $avatarImgId,"backgroundImgId": $backgroundImgId,"birthday": $birthday,"city": $city,"djStatus": $djStatus,"gender": $gender,"province": $province,"userId": $userId,"userType": $userType,"vipType": $vipType,"defaultAvatar": $defaultAvatar,"followed": $followed,"mutual": $mutual,"avatarImgIdStr": ${avatarImgIdStr != null?'${json.encode(avatarImgIdStr)}':'null'},"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"backgroundImgIdStr": ${backgroundImgIdStr != null?'${json.encode(backgroundImgIdStr)}':'null'},"backgroundUrl": ${backgroundUrl != null?'${json.encode(backgroundUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"detailDescription": ${detailDescription != null?'${json.encode(detailDescription)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'},"signature": ${signature != null?'${json.encode(signature)}':'null'}}';
  }
}

class Track {

  Object a;
  Object crbt;
  Object rt;
  Object rtUrl;
  Object rurl;
  int copyright;
  int cp;
  int djId;
  int dt;
  int fee;
  int ftype;
  int id;
  int mst;
  int mv;
  int no;
  int pop;
  int pst;
  int publishTime;
  int rtype;
  int s_id;
  int st;
  int t;
  int v;
  String cd;
  String cf;
  String name;
  List<dynamic> alia;
  List<Ar> ar;
  List<dynamic> rtUrls;
  Al al;
  H h;
  L l;
  M m;

  Track.fromParams({this.a, this.crbt, this.rt, this.rtUrl, this.rurl, this.copyright, this.cp, this.djId, this.dt, this.fee, this.ftype, this.id, this.mst, this.mv, this.no, this.pop, this.pst, this.publishTime, this.rtype, this.s_id, this.st, this.t, this.v, this.cd, this.cf, this.name, this.alia, this.ar, this.rtUrls, this.al, this.h, this.l, this.m});
  
  Track.fromJson(jsonRes) {
    a = jsonRes['a'];
    crbt = jsonRes['crbt'];
    rt = jsonRes['rt'];
    rtUrl = jsonRes['rtUrl'];
    rurl = jsonRes['rurl'];
    copyright = jsonRes['copyright'];
    cp = jsonRes['cp'];
    djId = jsonRes['djId'];
    dt = jsonRes['dt'];
    fee = jsonRes['fee'];
    ftype = jsonRes['ftype'];
    id = jsonRes['id'];
    mst = jsonRes['mst'];
    mv = jsonRes['mv'];
    no = jsonRes['no'];
    pop = jsonRes['pop'];
    pst = jsonRes['pst'];
    publishTime = jsonRes['publishTime'];
    rtype = jsonRes['rtype'];
    s_id = jsonRes['s_id'];
    st = jsonRes['st'];
    t = jsonRes['t'];
    v = jsonRes['v'];
    cd = jsonRes['cd'];
    cf = jsonRes['cf'];
    name = jsonRes['name'];
    alia = jsonRes['alia'] == null ? null : [];

    for (var aliaItem in alia == null ? [] : jsonRes['alia']){
            alia.add(aliaItem);
    }

    ar = jsonRes['ar'] == null ? null : [];

    for (var arItem in ar == null ? [] : jsonRes['ar']){
            ar.add(arItem == null ? null : new Ar.fromJson(arItem));
    }

    rtUrls = jsonRes['rtUrls'] == null ? null : [];

    for (var rtUrlsItem in rtUrls == null ? [] : jsonRes['rtUrls']){
            rtUrls.add(rtUrlsItem);
    }

    al = jsonRes['al'] == null ? null : new Al.fromJson(jsonRes['al']);
    h = jsonRes['h'] == null ? null : new H.fromJson(jsonRes['h']);
    l = jsonRes['l'] == null ? null : new L.fromJson(jsonRes['l']);
    m = jsonRes['m'] == null ? null : new M.fromJson(jsonRes['m']);
  }

  @override
  String toString() {
    return '{"a": $a,"crbt": $crbt,"rt": $rt,"rtUrl": $rtUrl,"rurl": $rurl,"copyright": $copyright,"cp": $cp,"djId": $djId,"dt": $dt,"fee": $fee,"ftype": $ftype,"id": $id,"mst": $mst,"mv": $mv,"no": $no,"pop": $pop,"pst": $pst,"publishTime": $publishTime,"rtype": $rtype,"s_id": $s_id,"st": $st,"t": $t,"v": $v,"cd": ${cd != null?'${json.encode(cd)}':'null'},"cf": ${cf != null?'${json.encode(cf)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"alia": $alia,"ar": $ar,"rtUrls": $rtUrls,"al": $al,"h": $h,"l": $l,"m": $m}';
  }
}

class M {

  String br;
  int fid;
  int size;
  Object vd;

  M.fromParams({this.br, this.fid, this.size, this.vd});
  
  M.fromJson(jsonRes) {
    br = jsonRes['br'].toString();
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class L {

  String br;
  int fid;
  int size;
  Object vd;

  L.fromParams({this.br, this.fid, this.size, this.vd});
  
  L.fromJson(jsonRes) {
    br = jsonRes['br'].toString();
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class H {

  String br;
  int fid;
  int size;
  Object vd;

  H.fromParams({this.br, this.fid, this.size, this.vd});
  
  H.fromJson(jsonRes) {
    br = jsonRes['br'].toString();
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class Al {

  int id;
  int pic;
  String name;
  String picUrl;
  String pic_str;
  List<String> tns;

  Al.fromParams({this.id, this.pic, this.name, this.picUrl, this.pic_str, this.tns});
  
  Al.fromJson(jsonRes) {
    id = jsonRes['id'];
    pic = jsonRes['pic'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    pic_str = jsonRes['pic_str'];
    tns = jsonRes['tns'] == null ? null : [];

    for (var tnsItem in tns == null ? [] : jsonRes['tns']){
            tns.add(tnsItem == null ? null : tnsItem.toString());
    }
  }

  @override
  String toString() {
    return '{"id": $id,"pic": $pic,"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"pic_str": ${pic_str != null?'${json.encode(pic_str)}':'null'},"tns": $tns}';
  }
}

class Ar {

  int id;
  String name;
  List<dynamic> alias;
  List<List<dynamic>> tns;

  Ar.fromParams({this.id, this.name, this.alias, this.tns});
  
  Ar.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem);
    }

    tns = jsonRes['tns'] == null ? null : [];

    for (var tnsItem in tns == null ? [] : jsonRes['tns']){      
  List<dynamic> tnsChild = tnsItem == null ? null : [];
    for (var tnsItemItem in tnsChild == null ? [] : tnsItem){
            tnsChild.add(tnsItemItem);
    }
      tns.add(tnsChild);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"name": ${name != null?'${json.encode(name)}':'null'},"alias": $alias,"tns": $tns}';
  }
}

class TrackId {

  int id;
  int v;

  TrackId.fromParams({this.id, this.v});
  
  TrackId.fromJson(jsonRes) {
    id = jsonRes['id'];
    v = jsonRes['v'];
  }

  @override
  String toString() {
    return '{"id": $id,"v": $v}';
  }
}

class Priviliege {

  int cp;
  int dl;
  int fee;
  int fl;
  int flag;
  int id;
  int maxbr;
  int payed;
  int pl;
  int sp;
  int st;
  int subp;
  bool cs;
  bool preSell;
  bool toast;

  Priviliege.fromParams({this.cp, this.dl, this.fee, this.fl, this.flag, this.id, this.maxbr, this.payed, this.pl, this.sp, this.st, this.subp, this.cs, this.preSell, this.toast});
  
  Priviliege.fromJson(jsonRes) {
    cp = jsonRes['cp'];
    dl = jsonRes['dl'];
    fee = jsonRes['fee'];
    fl = jsonRes['fl'];
    flag = jsonRes['flag'];
    id = jsonRes['id'];
    maxbr = jsonRes['maxbr'];
    payed = jsonRes['payed'];
    pl = jsonRes['pl'];
    sp = jsonRes['sp'];
    st = jsonRes['st'];
    subp = jsonRes['subp'];
    cs = jsonRes['cs'];
    preSell = jsonRes['preSell'];
    toast = jsonRes['toast'];
  }

  @override
  String toString() {
    return '{"cp": $cp,"dl": $dl,"fee": $fee,"fl": $fl,"flag": $flag,"id": $id,"maxbr": $maxbr,"payed": $payed,"pl": $pl,"sp": $sp,"st": $st,"subp": $subp,"cs": $cs,"preSell": $preSell,"toast": $toast}';
  }
}

