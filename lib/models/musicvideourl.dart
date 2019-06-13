part of model;

class MusicVideoUrlModel {

  int code;
  MusicVideoUrlData data;

  MusicVideoUrlModel.fromParams({this.code, this.data});

  factory MusicVideoUrlModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new MusicVideoUrlModel.fromJson(json.decode(jsonStr)) : new MusicVideoUrlModel.fromJson(jsonStr);
  
  MusicVideoUrlModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    data = jsonRes['data'] == null ? null : new MusicVideoUrlData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"data": $data}';
  }
}

class MusicVideoUrlData {

  int code;
  int expi;
  int fee;
  int id;
  int mvFee;
  int r;
  int size;
  int st;
  String md5;
  String msg;
  String url;

  MusicVideoUrlData.fromParams({this.code, this.expi, this.fee, this.id, this.mvFee, this.r, this.size, this.st, this.md5, this.msg, this.url});
  
  MusicVideoUrlData.fromJson(jsonRes) {
    code = jsonRes['code'];
    expi = jsonRes['expi'];
    fee = jsonRes['fee'];
    id = jsonRes['id'];
    mvFee = jsonRes['mvFee'];
    r = jsonRes['r'];
    size = jsonRes['size'];
    st = jsonRes['st'];
    md5 = jsonRes['md5'];
    msg = jsonRes['msg'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"code": $code,"expi": $expi,"fee": $fee,"id": $id,"mvFee": $mvFee,"r": $r,"size": $size,"st": $st,"md5": ${md5 != null?'${json.encode(md5)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

