part of model;

class SimilarMusicVideoModel {

  int code;
  List<MvData> mvs;

  SimilarMusicVideoModel.fromParams({this.code, this.mvs});

  factory SimilarMusicVideoModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SimilarMusicVideoModel.fromJson(json.decode(jsonStr)) : new SimilarMusicVideoModel.fromJson(jsonStr);
  
  SimilarMusicVideoModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    mvs = jsonRes['mvs'] == null ? null : [];

    for (var mvsItem in mvs == null ? [] : jsonRes['mvs']){
            mvs.add(mvsItem == null ? null : new MvData.fromJson(mvsItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"mvs": $mvs}';
  }
}

class MvData {

  Object briefDesc;
  Object desc;
  int artistId;
  int duration;
  int id;
  int mark;
  int playCount;
  String alg;
  String artistName;
  String cover;
  String name;
  List<Artist> artists;

  MvData.fromParams({this.briefDesc, this.desc, this.artistId, this.duration, this.id, this.mark, this.playCount, this.alg, this.artistName, this.cover, this.name, this.artists});
  
  MvData.fromJson(jsonRes) {
    briefDesc = jsonRes['briefDesc'];
    desc = jsonRes['desc'];
    artistId = jsonRes['artistId'];
    duration = jsonRes['duration'];
    id = jsonRes['id'];
    mark = jsonRes['mark'];
    playCount = jsonRes['playCount'];
    alg = jsonRes['alg'];
    artistName = jsonRes['artistName'];
    cover = jsonRes['cover'];
    name = jsonRes['name'];
    artists = jsonRes['artists'] == null ? null : [];

    for (var artistsItem in artists == null ? [] : jsonRes['artists']){
            artists.add(artistsItem == null ? null : new Artist.fromJson(artistsItem));
    }
  }

  @override
  String toString() {
    return '{"briefDesc": $briefDesc,"desc": $desc,"artistId": $artistId,"duration": $duration,"id": $id,"mark": $mark,"playCount": $playCount,"alg": ${alg != null?'${json.encode(alg)}':'null'},"artistName": ${artistName != null?'${json.encode(artistName)}':'null'},"cover": ${cover != null?'${json.encode(cover)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"artists": $artists}';
  }
}