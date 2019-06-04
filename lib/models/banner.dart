
part of model;
class BannerModel {

  int code;
  List<Data> banners;

  BannerModel.fromParams({this.code, this.banners});

  factory BannerModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new BannerModel.fromJson(json.decode(jsonStr)) : new BannerModel.fromJson(jsonStr);
  
  BannerModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    banners = jsonRes['banners'] == null ? null : [];

    for (var bannersItem in banners == null ? [] : jsonRes['banners']){
            banners.add(bannersItem == null ? null : new Data.fromJson(bannersItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"banners": $banners}';
  }
}

class Data {

  Object adLocation;
  Object adSource;
  Object adid;
  Object event;
  Object extMonitor;
  Object extMonitorInfo;
  Object monitorBlackList;
  Object monitorClick;
  Object monitorClickList;
  Object monitorImpress;
  Object monitorImpressList;
  Object monitorType;
  Object program;
  Object song;
  Object url;
  Object video;
  int targetId;
  int targetType;
  bool exclusive;
  String encodeId;
  String imageUrl;
  String scm;
  String titleColor;
  String typeTitle;

  Data.fromParams({this.adLocation, this.adSource, this.adid, this.event, this.extMonitor, this.extMonitorInfo, this.monitorBlackList, this.monitorClick, this.monitorClickList, this.monitorImpress, this.monitorImpressList, this.monitorType, this.program, this.song, this.url, this.video, this.targetId, this.targetType, this.exclusive, this.encodeId, this.imageUrl, this.scm, this.titleColor, this.typeTitle});
  
  Data.fromJson(jsonRes) {
    adLocation = jsonRes['adLocation'];
    adSource = jsonRes['adSource'];
    adid = jsonRes['adid'];
    event = jsonRes['event'];
    extMonitor = jsonRes['extMonitor'];
    extMonitorInfo = jsonRes['extMonitorInfo'];
    monitorBlackList = jsonRes['monitorBlackList'];
    monitorClick = jsonRes['monitorClick'];
    monitorClickList = jsonRes['monitorClickList'];
    monitorImpress = jsonRes['monitorImpress'];
    monitorImpressList = jsonRes['monitorImpressList'];
    monitorType = jsonRes['monitorType'];
    program = jsonRes['program'];
    song = jsonRes['song'];
    url = jsonRes['url'];
    video = jsonRes['video'];
    targetId = jsonRes['targetId'];
    targetType = jsonRes['targetType'];
    exclusive = jsonRes['exclusive'];
    encodeId = jsonRes['encodeId'];
    imageUrl = jsonRes['imageUrl'];
    scm = jsonRes['scm'];
    titleColor = jsonRes['titleColor'];
    typeTitle = jsonRes['typeTitle'];
  }

  @override
  String toString() {
    return '{"adLocation": $adLocation,"adSource": $adSource,"adid": $adid,"event": $event,"extMonitor": $extMonitor,"extMonitorInfo": $extMonitorInfo,"monitorBlackList": $monitorBlackList,"monitorClick": $monitorClick,"monitorClickList": $monitorClickList,"monitorImpress": $monitorImpress,"monitorImpressList": $monitorImpressList,"monitorType": $monitorType,"program": $program,"song": $song,"url": $url,"video": $video,"targetId": $targetId,"targetType": $targetType,"exclusive": $exclusive,"encodeId": ${encodeId != null?'${json.encode(encodeId)}':'null'},"imageUrl": ${imageUrl != null?'${json.encode(imageUrl)}':'null'},"scm": ${scm != null?'${json.encode(scm)}':'null'},"titleColor": ${titleColor != null?'${json.encode(titleColor)}':'null'},"typeTitle": ${typeTitle != null?'${json.encode(typeTitle)}':'null'}}';
  }
}

