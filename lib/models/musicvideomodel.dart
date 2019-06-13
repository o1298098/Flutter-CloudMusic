part of model;

class MusicVideoModel {

  int code;
  bool subed;
  String bufferPic;
  String bufferPicFS;
  String loadingPic;
  String loadingPicFS;
  MusicVideoData data;

  MusicVideoModel.fromParams({this.code, this.subed, this.bufferPic, this.bufferPicFS, this.loadingPic, this.loadingPicFS, this.data});

  factory MusicVideoModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MusicVideoModel.fromJson(json.decode(jsonStr)) : new MusicVideoModel.fromJson(jsonStr);
  
  MusicVideoModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    subed = jsonRes['subed'];
    bufferPic = jsonRes['bufferPic'];
    bufferPicFS = jsonRes['bufferPicFS'];
    loadingPic = jsonRes['loadingPic'];
    loadingPicFS = jsonRes['loadingPicFS'];
    data = jsonRes['data'] == null ? null : new MusicVideoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"subed": $subed,"bufferPic": ${bufferPic != null?'${json.encode(bufferPic)}':'null'},"bufferPicFS": ${bufferPicFS != null?'${json.encode(bufferPicFS)}':'null'},"loadingPic": ${loadingPic != null?'${json.encode(loadingPic)}':'null'},"loadingPicFS": ${loadingPicFS != null?'${json.encode(loadingPicFS)}':'null'},"data": $data}';
  }
}

class MusicVideoData {

  Object desc;
  int artistId;
  int commentCount;
  int coverId;
  int duration;
  int id;
  int likeCount;
  int nType;
  int playCount;
  int shareCount;
  int subCount;
  bool isReward;
  String artistName;
  String briefDesc;
  String commentThreadId;
  String cover;
  String name;
  String publishTime;
  List<Artists> artists;
  Br brs;

  MusicVideoData.fromParams({this.desc, this.artistId, this.commentCount, this.coverId, this.duration, this.id, this.likeCount, this.nType, this.playCount, this.shareCount, this.subCount, this.isReward, this.artistName, this.briefDesc, this.commentThreadId, this.cover, this.name, this.publishTime, this.artists, this.brs});
  
  MusicVideoData.fromJson(jsonRes) {
    desc = jsonRes['desc'];
    artistId = jsonRes['artistId'];
    commentCount = jsonRes['commentCount'];
    coverId = jsonRes['coverId'];
    duration = jsonRes['duration'];
    id = jsonRes['id'];
    likeCount = jsonRes['likeCount'];
    nType = jsonRes['nType'];
    playCount = jsonRes['playCount'];
    shareCount = jsonRes['shareCount'];
    subCount = jsonRes['subCount'];
    isReward = jsonRes['isReward'];
    artistName = jsonRes['artistName'];
    briefDesc = jsonRes['briefDesc'];
    commentThreadId = jsonRes['commentThreadId'];
    cover = jsonRes['cover'];
    name = jsonRes['name'];
    publishTime = jsonRes['publishTime'];
    artists = jsonRes['artists'] == null ? null : [];

    for (var artistsItem in artists == null ? [] : jsonRes['artists']){
            artists.add(artistsItem == null ? null : new Artists.fromJson(artistsItem));
    }

    brs = jsonRes['brs'] == null ? null : new Br.fromJson(jsonRes['brs']);
  }

  @override
  String toString() {
    return '{"desc": $desc,"artistId": $artistId,"commentCount": $commentCount,"coverId": ${cover != null?'${json.encode(cover)}':'null'}Id,"duration": $duration,"id": $id,"likeCount": $likeCount,"nType": $nType,"playCount": $playCount,"shareCount": $shareCount,"subCount": $subCount,"isReward": $isReward,"artistName": ${artistName != null?'${json.encode(artistName)}':'null'},"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"cover": ${cover != null?'${json.encode(cover)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"publishTime": ${publishTime != null?'${json.encode(publishTime)}':'null'},"artists": $artists,"brs": $brs}';
  }
}

class Br {

  String p240;
  String p480;
  String p720;
  String p1080;

  Br.fromParams({this.p240, this.p480, this.p720, this.p1080});
  
  Br.fromJson(jsonRes) {
    p240 = jsonRes['240'];
    p480 = jsonRes['480'];
    p720 = jsonRes['720'];
    p1080 = jsonRes['1080'];
  }

  @override
  String toString() {
    return '{"240": ${240 != null?'${json.encode(p240)}':'null'},"480": ${480 != null?'${json.encode(p480)}':'null'},"720": ${720 != null?'${json.encode(p720)}':'null'},"1080": ${1080 != null?'${json.encode(p1080)}':'null'}}';
  }
}

class Artists {

  int id;
  String name;

  Artists.fromParams({this.id, this.name});
  
  Artists.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"id": $id,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

