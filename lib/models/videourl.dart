part of model;

class VideoUrlModel {

  int code;
  List<VideoUrlData> urls;

  VideoUrlModel.fromParams({this.code, this.urls});

  factory VideoUrlModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VideoUrlModel.fromJson(json.decode(jsonStr)) : new VideoUrlModel.fromJson(jsonStr);
  
  VideoUrlModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    urls = jsonRes['urls'] == null ? null : [];

    for (var urlsItem in urls == null ? [] : jsonRes['urls']){
            urls.add(urlsItem == null ? null : new VideoUrlData.fromJson(urlsItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"urls": $urls}';
  }
}

class VideoUrlData {

  Object payInfo;
  int r;
  int size;
  int validityTime;
  bool needPay;
  String id;
  String url;

  VideoUrlData.fromParams({this.payInfo, this.r, this.size, this.validityTime, this.needPay, this.id, this.url});
  
  VideoUrlData.fromJson(jsonRes) {
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

