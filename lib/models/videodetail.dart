part of model;

class VideoDetialInfoModel {

  int code;
  String message;
  VideoDetailData data;

  VideoDetialInfoModel.fromParams({this.code, this.message, this.data});

  factory VideoDetialInfoModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoDetialInfoModel.fromJson(json.decode(jsonStr)) : new VideoDetialInfoModel.fromJson(jsonStr);
  
  VideoDetialInfoModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : new VideoDetailData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
  }
}

class VideoDetailData {

  Object videoUserLiveInfo;
  int authType;
  int commentCount;
  int durationms;
  int height;
  int playTime;
  int praisedCount;
  int publishTime;
  int shareCount;
  int subscribeCount;
  int width;
  bool advertisement;
  bool hasRelatedGameAd;
  String avatarUrl;
  String coverUrl;
  String description;
  String threadId;
  String title;
  String vid;
  List<int> markTypes;
  List<Resolution> resolutions;
  List<VideoGroup> videoGroup;
  Creator creator;

  VideoDetailData.fromParams({this.videoUserLiveInfo, this.authType, this.commentCount, this.durationms, this.height, this.playTime, this.praisedCount, this.publishTime, this.shareCount, this.subscribeCount, this.width, this.advertisement, this.hasRelatedGameAd, this.avatarUrl, this.coverUrl, this.description, this.threadId, this.title, this.vid, this.markTypes, this.resolutions, this.videoGroup, this.creator});
  
  VideoDetailData.fromJson(jsonRes) {
    videoUserLiveInfo = jsonRes['videoUserLiveInfo'];
    authType = jsonRes['authType'];
    commentCount = jsonRes['commentCount'];
    durationms = jsonRes['durationms'];
    height = jsonRes['height'];
    playTime = jsonRes['playTime'];
    praisedCount = jsonRes['praisedCount'];
    publishTime = jsonRes['publishTime'];
    shareCount = jsonRes['shareCount'];
    subscribeCount = jsonRes['subscribeCount'];
    width = jsonRes['width'];
    advertisement = jsonRes['advertisement'];
    hasRelatedGameAd = jsonRes['hasRelatedGameAd'];
    avatarUrl = jsonRes['avatarUrl'];
    coverUrl = jsonRes['coverUrl'];
    description = jsonRes['description'];
    threadId = jsonRes['threadId'];
    title = jsonRes['title'];
    vid = jsonRes['vid'];
    markTypes = jsonRes['markTypes'] == null ? null : [];

    for (var markTypesItem in markTypes == null ? [] : jsonRes['markTypes']){
            markTypes.add(markTypesItem);
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
  }

  @override
  String toString() {
    return '{"videoUserLiveInfo": ${vid != null?'${json.encode(vid)}':'null'}eoUserLiveInfo,"authType": $authType,"commentCount": $commentCount,"durationms": $durationms,"height": $height,"playTime": $playTime,"praisedCount": $praisedCount,"publishTime": $publishTime,"shareCount": $shareCount,"subscribeCount": $subscribeCount,"width": $width,"advertisement": $advertisement,"hasRelatedGameAd": $hasRelatedGameAd,"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"coverUrl": ${coverUrl != null?'${json.encode(coverUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"threadId": ${threadId != null?'${json.encode(threadId)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"vid": ${vid != null?'${json.encode(vid)}':'null'},"markTypes": $markTypes,"resolutions": $resolutions,"videoGroup": $videoGroup,"creator": $creator}';
  }
}

