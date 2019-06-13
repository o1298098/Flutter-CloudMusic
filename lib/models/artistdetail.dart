import 'dart:convert' show json;

class ArtistDetailModel {

  int code;
  bool more;
  List<HotSong> hotSongs;
  Artist artist;

  ArtistDetailModel.fromParams({this.code, this.more, this.hotSongs, this.artist});

  factory ArtistDetailModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ArtistDetailModel.fromJson(json.decode(jsonStr)) : new ArtistDetailModel.fromJson(jsonStr);
  
  ArtistDetailModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    more = jsonRes['more'];
    hotSongs = jsonRes['hotSongs'] == null ? null : [];

    for (var hotSongsItem in hotSongs == null ? [] : jsonRes['hotSongs']){
            hotSongs.add(hotSongsItem == null ? null : new HotSong.fromJson(hotSongsItem));
    }

    artist = jsonRes['artist'] == null ? null : new Artist.fromJson(jsonRes['artist']);
  }

  @override
  String toString() {
    return '{"code": $code,"more": $more,"hotSongs": $hotSongs,"artist": $artist}';
  }
}

class Artist {

  int albumSize;
  int id;
  int img1v1Id;
  int musicSize;
  int mvSize;
  int picId;
  int publishTime;
  int topicPerson;
  bool followed;
  String briefDesc;
  String img1v1Id_str;
  String img1v1Url;
  String name;
  String picId_str;
  String picUrl;
  String trans;
  List<String> alias;

  Artist.fromParams({this.albumSize, this.id, this.img1v1Id, this.musicSize, this.mvSize, this.picId, this.publishTime, this.topicPerson, this.followed, this.briefDesc, this.img1v1Id_str, this.img1v1Url, this.name, this.picId_str, this.picUrl, this.trans, this.alias});
  
  Artist.fromJson(jsonRes) {
    albumSize = jsonRes['albumSize'];
    id = jsonRes['id'];
    img1v1Id = jsonRes['img1v1Id'];
    musicSize = jsonRes['musicSize'];
    mvSize = jsonRes['mvSize'];
    picId = jsonRes['picId'];
    publishTime = jsonRes['publishTime'];
    topicPerson = jsonRes['topicPerson'];
    followed = jsonRes['followed'];
    briefDesc = jsonRes['briefDesc'];
    img1v1Id_str = jsonRes['img1v1Id_str'];
    img1v1Url = jsonRes['img1v1Url'];
    name = jsonRes['name'];
    picId_str = jsonRes['picId_str'];
    picUrl = jsonRes['picUrl'];
    trans = jsonRes['trans'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem);
    }
  }

  @override
  String toString() {
    return '{"albumSize": $albumSize,"id": $id,"img1v1Id": $img1v1Id,"musicSize": $musicSize,"mvSize": $mvSize,"picId": $picId,"publishTime": $publishTime,"topicPerson": $topicPerson,"followed": $followed,"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"img1v1Id_str": ${img1v1Id_str != null?'${json.encode(img1v1Id_str)}':'null'},"img1v1Url": ${img1v1Url != null?'${json.encode(img1v1Url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picId_str": ${picId_str != null?'${json.encode(picId_str)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"trans": ${trans != null?'${json.encode(trans)}':'null'},"alias": $alias}';
  }
}

class HotSong {

  Object a;
  Object crbt;
  Object rtUrl;
  Object rurl;
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
  int rtype;
  int st;
  int t;
  int v;
  String cd;
  String cf;
  String eq;
  String name;
  String rt;
  List<dynamic> alia;
  List<ArData> ar;
  List<dynamic> rtUrls;
  AlData al;
  H h;
  L l;
  M m;
  Privilege privilege;

  HotSong.fromParams({this.a, this.crbt, this.rtUrl, this.rurl, this.cp, this.djId, this.dt, this.fee, this.ftype, this.id, this.mst, this.mv, this.no, this.pop, this.pst, this.rtype, this.st, this.t, this.v, this.cd, this.cf, this.eq, this.name, this.rt, this.alia, this.ar, this.rtUrls, this.al, this.h, this.l, this.m, this.privilege});
  
  HotSong.fromJson(jsonRes) {
    a = jsonRes['a'];
    crbt = jsonRes['crbt'];
    rtUrl = jsonRes['rtUrl'];
    rurl = jsonRes['rurl'];
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
    rtype = jsonRes['rtype'];
    st = jsonRes['st'];
    t = jsonRes['t'];
    v = jsonRes['v'];
    cd = jsonRes['cd'];
    cf = jsonRes['cf'];
    eq = jsonRes['eq'];
    name = jsonRes['name'];
    rt = jsonRes['rt'];
    alia = jsonRes['alia'] == null ? null : [];

    for (var aliaItem in alia == null ? [] : jsonRes['alia']){
            alia.add(aliaItem);
    }

    ar = jsonRes['ar'] == null ? null : [];

    for (var arItem in ar == null ? [] : jsonRes['ar']){
            ar.add(arItem == null ? null : new ArData.fromJson(arItem));
    }

    rtUrls = jsonRes['rtUrls'] == null ? null : [];

    for (var rtUrlsItem in rtUrls == null ? [] : jsonRes['rtUrls']){
            rtUrls.add(rtUrlsItem);
    }

    al = jsonRes['al'] == null ? null : new AlData.fromJson(jsonRes['al']);
    h = jsonRes['h'] == null ? null : new H.fromJson(jsonRes['h']);
    l = jsonRes['l'] == null ? null : new L.fromJson(jsonRes['l']);
    m = jsonRes['m'] == null ? null : new M.fromJson(jsonRes['m']);
    privilege = jsonRes['privilege'] == null ? null : new Privilege.fromJson(jsonRes['privilege']);
  }

  @override
  String toString() {
    return '{"a": $a,"crbt": $crbt,"rtUrl": ${rt != null?'${json.encode(rt)}':'null'}Url,"rurl": $rurl,"cp": $cp,"djId": $djId,"dt": $dt,"fee": $fee,"ftype": $ftype,"id": $id,"mst": $mst,"mv": $mv,"no": $no,"pop": $pop,"pst": $pst,"rtype": ${rt != null?'${json.encode(rt)}':'null'}ype,"st": $st,"t": $t,"v": $v,"cd": ${cd != null?'${json.encode(cd)}':'null'},"cf": ${cf != null?'${json.encode(cf)}':'null'},"eq": ${eq != null?'${json.encode(eq)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"rt": ${rt != null?'${json.encode(rt)}':'null'},"alia": $alia,"ar": $ar,"rtUrls": $rtUrls,"al": $al,"h": $h,"l": $l,"m": $m,"privilege": $privilege}';
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

class M {

  int br;
  int fid;
  int size;
  int vd;

  M.fromParams({this.br, this.fid, this.size, this.vd});
  
  M.fromJson(jsonRes) {
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

class L {

  int br;
  int fid;
  int size;
  int vd;

  L.fromParams({this.br, this.fid, this.size, this.vd});
  
  L.fromJson(jsonRes) {
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

class H {

  int br;
  int fid;
  int size;
  int vd;

  H.fromParams({this.br, this.fid, this.size, this.vd});
  
  H.fromJson(jsonRes) {
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

class AlData {

  int id;
  int pic;
  String name;
  String picUrl;
  String pic_str;
  List<String> tns;

  AlData.fromParams({this.id, this.pic, this.name, this.picUrl, this.pic_str, this.tns});
  
  AlData.fromJson(jsonRes) {
    id = jsonRes['id'];
    pic = jsonRes['pic'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    pic_str = jsonRes['pic_str'];
    tns = jsonRes['tns'] == null ? null : [];

    for (var tnsItem in tns == null ? [] : jsonRes['tns']){
            tns.add(tnsItem);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"pic": $pic,"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"pic_str": ${pic_str != null?'${json.encode(pic_str)}':'null'},"tns": $tns}';
  }
}

class ArData {

  int id;
  String name;
  List<String> alia;

  ArData.fromParams({this.id, this.name, this.alia});
  
  ArData.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
    alia = jsonRes['alia'] == null ? null : [];

    for (var aliaItem in alia == null ? [] : jsonRes['alia']){
            alia.add(aliaItem);
    }
  }

  @override
  String toString() {
    return '{"id": $id,"name": ${name != null?'${json.encode(name)}':'null'},"alia": $alia}';
  }
}

