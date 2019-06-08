part of model;

class SimilarVideoModel {

  int code;
  String message;
  List<SimilarVideoData> data;

  SimilarVideoModel.fromParams({this.code, this.message, this.data});

  factory SimilarVideoModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SimilarVideoModel.fromJson(json.decode(jsonStr)) : new SimilarVideoModel.fromJson(jsonStr);
  
  SimilarVideoModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
            data.add(dataItem == null ? null : new SimilarVideoData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
  }
}

class SimilarVideoData {

  Object aliaName;
  Object transName;
  int durationms;
  int playTime;
  int type;
  String alg;
  String coverUrl;
  String title;
  String vid;
  List<Creator> creator;
  List<int> markTypes;

  SimilarVideoData.fromParams({this.aliaName, this.transName, this.durationms, this.playTime, this.type, this.alg, this.coverUrl, this.title, this.vid, this.creator, this.markTypes});
  
  SimilarVideoData.fromJson(jsonRes) {
    aliaName = jsonRes['aliaName'];
    transName = jsonRes['transName'];
    durationms = jsonRes['durationms'];
    playTime = jsonRes['playTime'];
    type = jsonRes['type'];
    alg = jsonRes['alg'];
    coverUrl = jsonRes['coverUrl'];
    title = jsonRes['title'];
    vid = jsonRes['vid'];
    creator = jsonRes['creator'] == null ? null : [];

    for (var creatorItem in creator == null ? [] : jsonRes['creator']){
            creator.add(creatorItem == null ? null : new Creator.fromJson(creatorItem));
    }

    markTypes = jsonRes['markTypes'] == null ? null : [];

    for (var markTypesItem in markTypes == null ? [] : jsonRes['markTypes']){
            markTypes.add(markTypesItem);
    }
  }

  @override
  String toString() {
    return '{"aliaName": $aliaName,"transName": $transName,"durationms": $durationms,"playTime": $playTime,"type": $type,"alg": ${alg != null?'${json.encode(alg)}':'null'},"coverUrl": ${coverUrl != null?'${json.encode(coverUrl)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"vid": ${vid != null?'${json.encode(vid)}':'null'},"creator": $creator,"markTypes": $markTypes}';
  }
}

