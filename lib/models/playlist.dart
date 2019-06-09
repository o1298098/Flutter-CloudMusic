part of model;

class PlayListModel {

  int code;
  bool more;
  List<PlayListData> playlist;

  PlayListModel.fromParams({this.code, this.more, this.playlist});

  factory PlayListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new PlayListModel.fromJson(json.decode(jsonStr)) : new PlayListModel.fromJson(jsonStr);
  
  PlayListModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    more = jsonRes['more'];
    playlist = jsonRes['playlist'] == null ? null : [];

    for (var playlistItem in playlist == null ? [] : jsonRes['playlist']){
            playlist.add(playlistItem == null ? null : new PlayListData.fromJson(playlistItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"more": $more,"playlist": $playlist}';
  }
}

class PlayListData {

  Object artists;
  Object backgroundCoverUrl;
  Object tracks;
  Object updateFrequency;
  int adType;
  int backgroundCoverId;
  int cloudTrackCount;
  int coverImgId;
  int createTime;
  int id;
  int playCount;
  int privacy;
  int specialType;
  int status;
  int subscribedCount;
  int totalDuration;
  int trackCount;
  int trackNumberUpdateTime;
  int trackUpdateTime;
  int updateTime;
  int userId;
  bool anonimous;
  bool highQuality;
  bool newImported;
  bool ordered;
  bool subscribed;
  String commentThreadId;
  String coverImgId_str;
  String coverImgUrl;
  String description;
  String name;
  List<dynamic> subscribers;
  List<String> tags;
  Creator creator;

  PlayListData.fromParams({this.artists, this.backgroundCoverUrl, this.tracks, this.updateFrequency, this.adType, this.backgroundCoverId, this.cloudTrackCount, this.coverImgId, this.createTime, this.id, this.playCount, this.privacy, this.specialType, this.status, this.subscribedCount, this.totalDuration, this.trackCount, this.trackNumberUpdateTime, this.trackUpdateTime, this.updateTime, this.userId, this.anonimous, this.highQuality, this.newImported, this.ordered, this.subscribed, this.commentThreadId, this.coverImgId_str, this.coverImgUrl, this.description, this.name, this.subscribers, this.tags, this.creator});
  
  PlayListData.fromJson(jsonRes) {
    artists = jsonRes['artists'];
    backgroundCoverUrl = jsonRes['backgroundCoverUrl'];
    tracks = jsonRes['tracks'];
    updateFrequency = jsonRes['updateFrequency'];
    adType = jsonRes['adType'];
    backgroundCoverId = jsonRes['backgroundCoverId'];
    cloudTrackCount = jsonRes['cloudTrackCount'];
    coverImgId = jsonRes['coverImgId'];
    createTime = jsonRes['createTime'];
    id = jsonRes['id'];
    playCount = jsonRes['playCount'];
    privacy = jsonRes['privacy'];
    specialType = jsonRes['specialType'];
    status = jsonRes['status'];
    subscribedCount = jsonRes['subscribedCount'];
    totalDuration = jsonRes['totalDuration'];
    trackCount = jsonRes['trackCount'];
    trackNumberUpdateTime = jsonRes['trackNumberUpdateTime'];
    trackUpdateTime = jsonRes['trackUpdateTime'];
    updateTime = jsonRes['updateTime'];
    userId = jsonRes['userId'];
    anonimous = jsonRes['anonimous'];
    highQuality = jsonRes['highQuality'];
    newImported = jsonRes['newImported'];
    ordered = jsonRes['ordered'];
    subscribed = jsonRes['subscribed'];
    commentThreadId = jsonRes['commentThreadId'];
    coverImgId_str = jsonRes['coverImgId_str'];
    coverImgUrl = jsonRes['coverImgUrl'];
    description = jsonRes['description'];
    name = jsonRes['name'];
    subscribers = jsonRes['subscribers'] == null ? null : [];

    for (var subscribersItem in subscribers == null ? [] : jsonRes['subscribers']){
            subscribers.add(subscribersItem);
    }

    tags = jsonRes['tags'] == null ? null : [];

    for (var tagsItem in tags == null ? [] : jsonRes['tags']){
            tags.add(tagsItem);
    }

    creator = jsonRes['creator'] == null ? null : new Creator.fromJson(jsonRes['creator']);
  }

  @override
  String toString() {
    return '{"artists": $artists,"backgroundCoverUrl": $backgroundCoverUrl,"tracks": $tracks,"updateFrequency": $updateFrequency,"adType": $adType,"backgroundCoverId": $backgroundCoverId,"cloudTrackCount": $cloudTrackCount,"coverImgId": $coverImgId,"createTime": $createTime,"id": $id,"playCount": $playCount,"privacy": $privacy,"specialType": $specialType,"status": $status,"subscribedCount": $subscribedCount,"totalDuration": $totalDuration,"trackCount": $trackCount,"trackNumberUpdateTime": $trackNumberUpdateTime,"trackUpdateTime": $trackUpdateTime,"updateTime": $updateTime,"userId": $userId,"anonimous": $anonimous,"highQuality": $highQuality,"newImported": $newImported,"ordered": $ordered,"subscribed": $subscribed,"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"coverImgId_str": ${coverImgId_str != null?'${json.encode(coverImgId_str)}':'null'},"coverImgUrl": ${coverImgUrl != null?'${json.encode(coverImgUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"subscribers": $subscribers,"tags": $tags,"creator": $creator}';
  }
}

