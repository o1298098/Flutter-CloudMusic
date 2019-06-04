part of model;

class VideoGroupMpdel {

  int code;
  int rcmdLimit;
  bool hasmore;
  String msg;
  List<VideoData> datas;

  VideoGroupMpdel.fromParams({this.code, this.rcmdLimit, this.hasmore, this.msg, this.datas});

  factory VideoGroupMpdel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoGroupMpdel.fromJson(json.decode(jsonStr)) : new VideoGroupMpdel.fromJson(jsonStr);
  
  VideoGroupMpdel.fromJson(jsonRes) {
    code = jsonRes['code'];
    rcmdLimit = jsonRes['rcmdLimit'];
    hasmore = jsonRes['hasmore'];
    msg = jsonRes['msg'];
    datas = jsonRes['datas'] == null ? null : [];

    for (var datasItem in datas == null ? [] : jsonRes['datas']){
            datas.add(datasItem == null ? null : new VideoData.fromJson(datasItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"rcmdLimit": $rcmdLimit,"hasmore": $hasmore,"msg": ${msg != null?'${json.encode(msg)}':'null'},"datas": $datas}';
  }
}

class VideoData {

  Object extAlg;
  int type;
  bool displayed;
  String alg;
  VideoInfo data;

  VideoData.fromParams({this.extAlg, this.type, this.displayed, this.alg, this.data});
  
  VideoData.fromJson(jsonRes) {
    extAlg = jsonRes['extAlg'];
    type = jsonRes['type'];
    displayed = jsonRes['displayed'];
    alg = jsonRes['alg'];
    data = jsonRes['data'] == null ? null : new VideoInfo.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"extAlg": $extAlg,"type": $type,"displayed": $displayed,"alg": ${alg != null?'${json.encode(alg)}':'null'},"data": $data}';
  }
}

class VideoInfo {

  Object description;
  Object markTypes;
  Object previewUrl;
  Object relatedInfo;
  Object videoUserLiveInfo;
  int commentCount;
  int durationms;
  int height;
  int playTime;
  int praisedCount;
  int previewDurationms;
  int shareCount;
  int width;
  bool hasRelatedGameAd;
  bool praised;
  bool subscribed;
  String alg;
  String coverUrl;
  String scm;
  String threadId;
  String title;
  String vid;
  List<RelateSong> relateSong;
  List<Resolution> resolutions;
  List<VideoGroup> videoGroup;
  Creator creator;
  UrlInfo urlInfo;

  VideoInfo.fromParams({this.description, this.markTypes, this.previewUrl, this.relatedInfo, this.videoUserLiveInfo, this.commentCount, this.durationms, this.height, this.playTime, this.praisedCount, this.previewDurationms, this.shareCount, this.width, this.hasRelatedGameAd, this.praised, this.subscribed, this.alg, this.coverUrl, this.scm, this.threadId, this.title, this.vid, this.relateSong, this.resolutions, this.videoGroup, this.creator, this.urlInfo});
  
  VideoInfo.fromJson(jsonRes) {
    description = jsonRes['description'];
    markTypes = jsonRes['markTypes'];
    previewUrl = jsonRes['previewUrl'];
    relatedInfo = jsonRes['relatedInfo'];
    videoUserLiveInfo = jsonRes['videoUserLiveInfo'];
    commentCount = jsonRes['commentCount'];
    durationms = jsonRes['durationms'];
    height = jsonRes['height'];
    playTime = jsonRes['playTime'];
    praisedCount = jsonRes['praisedCount'];
    previewDurationms = jsonRes['previewDurationms'];
    shareCount = jsonRes['shareCount'];
    width = jsonRes['width'];
    hasRelatedGameAd = jsonRes['hasRelatedGameAd'];
    praised = jsonRes['praised'];
    subscribed = jsonRes['subscribed'];
    alg = jsonRes['alg'];
    coverUrl = jsonRes['coverUrl'];
    scm = jsonRes['scm'];
    threadId = jsonRes['threadId'];
    title = jsonRes['title'];
    vid = jsonRes['vid'];
    relateSong = jsonRes['relateSong'] == null ? null : [];

    for (var relateSongItem in relateSong == null ? [] : jsonRes['relateSong']){
            relateSong.add(relateSongItem == null ? null : new RelateSong.fromJson(relateSongItem));
    }

    resolutions = jsonRes['resolutions'] == null ? null : [];

    for (var resolutionsItem in resolutions == null ? [] : jsonRes['resolutions']){
            resolutions.add(resolutionsItem == null ? null : new Resolution.fromJson(resolutionsItem));
    }

    videoGroup = jsonRes['videoGroup'] == null ? null : [];

    for (var videoGroupItem in videoGroup == null ? [] : jsonRes['videoGroup']){
            videoGroup.add(videoGroupItem == null ? null : new VideoGroup.fromJson(videoGroupItem));
    }

    creator = jsonRes['creator'] == null ? null : new Creator.fromJson(jsonRes['creator']);
    urlInfo = jsonRes['urlInfo'] == null ? null : new UrlInfo.fromJson(jsonRes['urlInfo']);
  }

  @override
  String toString() {
    return '{"description": $description,"markTypes": $markTypes,"previewUrl": $previewUrl,"relatedInfo": $relatedInfo,"videoUserLiveInfo": ${vid != null?'${json.encode(vid)}':'null'}eoUserLiveInfo,"commentCount": $commentCount,"durationms": $durationms,"height": $height,"playTime": $playTime,"praisedCount": $praisedCount,"previewDurationms": $previewDurationms,"shareCount": $shareCount,"width": $width,"hasRelatedGameAd": $hasRelatedGameAd,"praised": $praised,"subscribed": $subscribed,"alg": ${alg != null?'${json.encode(alg)}':'null'},"coverUrl": ${coverUrl != null?'${json.encode(coverUrl)}':'null'},"scm": ${scm != null?'${json.encode(scm)}':'null'},"threadId": ${threadId != null?'${json.encode(threadId)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"vid": ${vid != null?'${json.encode(vid)}':'null'},"relateSong": $relateSong,"resolutions": $resolutions,"videoGroup": $videoGroup,"creator": $creator,"urlInfo": $urlInfo}';
  }
}

class UrlInfo {

  Object payInfo;
  int r;
  int size;
  int validityTime;
  bool needPay;
  String id;
  String url;

  UrlInfo.fromParams({this.payInfo, this.r, this.size, this.validityTime, this.needPay, this.id, this.url});
  
  UrlInfo.fromJson(jsonRes) {
    payInfo = jsonRes['payInfo'];
    r = jsonRes['r'];
    size = jsonRes['size'];
    validityTime = jsonRes['validityTime'];
    needPay = jsonRes['needPay'];
    id = jsonRes['id'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"payInfo": $payInfo,"r": $r,"size": $size,"validityTime": $validityTime,"needPay": $needPay,"id": ${id != null?'${json.encode(id)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

class VideoGroup {

  int id;
  String alg;
  String name;

  VideoGroup.fromParams({this.id, this.alg, this.name});
  
  VideoGroup.fromJson(jsonRes) {
    id = jsonRes['id'];
    alg = jsonRes['alg'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"alg": ${alg != null?'${json.encode(alg)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
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

class RelateSong {

  Object a;
  Object crbt;
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
  String rt;
  List<dynamic> alia;
  List<Ar> ar;
  List<dynamic> rtUrls;
  RtUrl al;
  HModel h;
  LModel l;
  MModel m;
  Privilege privilege;

  RelateSong.fromParams({this.a, this.crbt, this.rtUrl, this.rurl, this.copyright, this.cp, this.djId, this.dt, this.fee, this.ftype, this.id, this.mst, this.mv, this.no, this.pop, this.pst, this.publishTime, this.rtype, this.s_id, this.st, this.t, this.v, this.cd, this.cf, this.name, this.rt, this.alia, this.ar, this.rtUrls, this.al, this.h, this.l, this.m, this.privilege});
  
  RelateSong.fromJson(jsonRes) {
    a = jsonRes['a'];
    crbt = jsonRes['crbt'];
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
    rt = jsonRes['rt'];
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

    al = jsonRes['al'] == null ? null : new RtUrl.fromJson(jsonRes['al']);
    h = jsonRes['h'] == null ? null : new HModel.fromJson(jsonRes['h']);
    l = jsonRes['l'] == null ? null : new LModel.fromJson(jsonRes['l']);
    m = jsonRes['m'] == null ? null : new MModel.fromJson(jsonRes['m']);
    privilege = jsonRes['privilege'] == null ? null : new Privilege.fromJson(jsonRes['privilege']);
  }

  @override
  String toString() {
    return '{"a": $a,"crbt": $crbt,"rtUrl": ${rt != null?'${json.encode(rt)}':'null'}Url,"rurl": $rurl,"copyright": $copyright,"cp": $cp,"djId": $djId,"dt": $dt,"fee": $fee,"ftype": $ftype,"id": $id,"mst": $mst,"mv": $mv,"no": $no,"pop": $pop,"pst": $pst,"publishTime": $publishTime,"rtype": ${rt != null?'${json.encode(rt)}':'null'}ype,"s_id": $s_id,"st": $st,"t": $t,"v": $v,"cd": ${cd != null?'${json.encode(cd)}':'null'},"cf": ${cf != null?'${json.encode(cf)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"rt": ${rt != null?'${json.encode(rt)}':'null'},"alia": $alia,"ar": $ar,"rtUrls": $rtUrls,"al": $al,"h": $h,"l": $l,"m": $m,"privilege": $privilege}';
  }
}

class Privilege {

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

  Privilege.fromParams({this.cp, this.dl, this.fee, this.fl, this.flag, this.id, this.maxbr, this.payed, this.pl, this.sp, this.st, this.subp, this.cs, this.preSell, this.toast});
  
  Privilege.fromJson(jsonRes) {
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

class MModel {

  int br;
  int fid;
  int size;
  Object vd;

  MModel.fromParams({this.br, this.fid, this.size, this.vd});
  
  MModel.fromJson(jsonRes) {
    br = jsonRes['br'];
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class LModel {

  int br;
  int fid;
  int size;
  Object vd;

  LModel.fromParams({this.br, this.fid, this.size, this.vd});
  
  LModel.fromJson(jsonRes) {
    br = jsonRes['br'];
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class HModel {

  int br;
  int fid;
  int size;
  Object vd;

  HModel.fromParams({this.br, this.fid, this.size, this.vd});
  
  HModel.fromJson(jsonRes) {
    br = jsonRes['br'];
    fid = jsonRes['fid'];
    size = jsonRes['size'];
    vd = jsonRes['vd'];
  }

  @override
  String toString() {
    return '{"br": $br,"fid": $fid,"size": $size,"vd": $vd}';
  }
}

class RtUrl {

  int id;
  int pic;
  String name;
  String picUrl;
  List<HModel> tns;

  RtUrl.fromParams({this.id, this.pic, this.name, this.picUrl, this.tns});
  
  RtUrl.fromJson(jsonRes) {
    id = jsonRes['id'];
    pic = jsonRes['pic'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    tns = jsonRes['tns'] == null ? null : [];
   
  }

  @override
  String toString() {
    return '{"id": $id,"pic": $pic,"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"tns": $tns}';
  }
}
