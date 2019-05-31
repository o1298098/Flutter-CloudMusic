part of model;

class PersonalizedModel {

  int category;
  int code;
  bool hasTaste;
  List<PersonalizedData> result;

  PersonalizedModel.fromParams({this.category, this.code, this.hasTaste, this.result});

  factory PersonalizedModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new PersonalizedModel.fromJson(json.decode(jsonStr)) : new PersonalizedModel.fromJson(jsonStr);
  
  PersonalizedModel.fromJson(jsonRes) {
    category = jsonRes['category'];
    code = jsonRes['code'];
    hasTaste = jsonRes['hasTaste'];
    result = jsonRes['result'] == null ? null : [];

    for (var resultItem in result == null ? [] : jsonRes['result']){
            result.add(resultItem == null ? null : new PersonalizedData.fromJson(resultItem));
    }
  }

  @override
  String toString() {
    return '{"category": $category,"code": $code,"hasTaste": $hasTaste,"result": $result}';
  }
}

class PersonalizedData {

  int id;
  Object playCount;
  int trackCount;
  int type;
  bool canDislike;
  bool highQuality;
  String alg;
  String copywriter;
  String name;
  String picUrl;

  PersonalizedData.fromParams({this.id, this.playCount, this.trackCount, this.type, this.canDislike, this.highQuality, this.alg, this.copywriter, this.name, this.picUrl});
  
  PersonalizedData.fromJson(jsonRes) {
    id = jsonRes['id'];
    playCount = jsonRes['playCount'];
    trackCount = jsonRes['trackCount'];
    type = jsonRes['type'];
    canDislike = jsonRes['canDislike'];
    highQuality = jsonRes['highQuality'];
    alg = jsonRes['alg'];
    copywriter = jsonRes['copywriter'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
  }

  @override
  String toString() {
    return '{"id": $id,"playCount": $playCount,"trackCount": $trackCount,"type": $type,"canDislike": $canDislike,"highQuality": $highQuality,"alg": ${alg != null?'${json.encode(alg)}':'null'},"copywriter": ${copywriter != null?'${json.encode(copywriter)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'}}';
  }
}

