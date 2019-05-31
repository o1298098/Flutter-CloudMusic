part of model;

class NewAlbumModel {

  int code;
  int total;
  List<NewAlbum> albums;

  NewAlbumModel.fromParams({this.code, this.total, this.albums});

  factory NewAlbumModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new NewAlbumModel.fromJson(json.decode(jsonStr)) : new NewAlbumModel.fromJson(jsonStr);
  
  NewAlbumModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    total = jsonRes['total'];
    albums = jsonRes['albums'] == null ? null : [];

    for (var albumsItem in albums == null ? [] : jsonRes['albums']){
            albums.add(albumsItem == null ? null : new NewAlbum.fromJson(albumsItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"total": $total,"albums": $albums}';
  }
}

class NewAlbum {

  int companyId;
  int copyrightId;
  int id;
  int pic;
  int picId;
  int publishTime;
  int size;
  int status;
  bool onSale;
  bool paid;
  String blurPicUrl;
  String briefDesc;
  String commentThreadId;
  String company;
  String description;
  String name;
  String picId_str;
  String picUrl;
  String subType;
  String tags;
  String type;
  List<dynamic> alias;
  List<Album> artists;
  List<dynamic> songs;
  Artist artist;

  NewAlbum.fromParams({this.companyId, this.copyrightId, this.id, this.pic, this.picId, this.publishTime, this.size, this.status, this.onSale, this.paid, this.blurPicUrl, this.briefDesc, this.commentThreadId, this.company, this.description, this.name, this.picId_str, this.picUrl, this.subType, this.tags, this.type, this.alias, this.artists, this.songs, this.artist});
  
  NewAlbum.fromJson(jsonRes) {
    companyId = jsonRes['companyId'];
    copyrightId = jsonRes['copyrightId'];
    id = jsonRes['id'];
    pic = jsonRes['pic'];
    picId = jsonRes['picId'];
    publishTime = jsonRes['publishTime'];
    size = jsonRes['size'];
    status = jsonRes['status'];
    onSale = jsonRes['onSale'];
    paid = jsonRes['paid'];
    blurPicUrl = jsonRes['blurPicUrl'];
    briefDesc = jsonRes['briefDesc'];
    commentThreadId = jsonRes['commentThreadId'];
    company = jsonRes['company'];
    description = jsonRes['description'];
    name = jsonRes['name'];
    picId_str = jsonRes['picId_str'];
    picUrl = jsonRes['picUrl'];
    subType = jsonRes['subType'];
    tags = jsonRes['tags'];
    type = jsonRes['type'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){
            alias.add(aliasItem);
    }

    artists = jsonRes['artists'] == null ? null : [];

    for (var artistsItem in artists == null ? [] : jsonRes['artists']){
            artists.add(artistsItem == null ? null : new Album.fromJson(artistsItem));
    }

    songs = jsonRes['songs'] == null ? null : [];

    for (var songsItem in songs == null ? [] : jsonRes['songs']){
            songs.add(songsItem);
    }

    artist = jsonRes['artist'] == null ? null : new Artist.fromJson(jsonRes['artist']);
  }

  @override
  String toString() {
    return '{"companyId": ${company != null?'${json.encode(company)}':'null'}Id,"copyrightId": $copyrightId,"id": $id,"pic": $pic,"picId": $picId,"publishTime": $publishTime,"size": $size,"status": $status,"onSale": $onSale,"paid": $paid,"blurPicUrl": ${blurPicUrl != null?'${json.encode(blurPicUrl)}':'null'},"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"commentThreadId": ${commentThreadId != null?'${json.encode(commentThreadId)}':'null'},"company": ${company != null?'${json.encode(company)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picId_str": ${picId_str != null?'${json.encode(picId_str)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"subType": ${subType != null?'${json.encode(subType)}':'null'},"tags": ${tags != null?'${json.encode(tags)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'},"alias": $alias,"artists": $artists,"songs": $songs,"artist": $artist}';
  }
}

class Artist {

  int albumSize;
  int id;
  int img1v1Id;
  int musicSize;
  int picId;
  int topicPerson;
  bool followed;
  String briefDesc;
  String img1v1Id_str;
  String img1v1Url;
  String name;
  String picId_str;
  String picUrl;
  String trans;
  List<dynamic> alias;

  Artist.fromParams({this.albumSize, this.id, this.img1v1Id, this.musicSize, this.picId, this.topicPerson, this.followed, this.briefDesc, this.img1v1Id_str, this.img1v1Url, this.name, this.picId_str, this.picUrl, this.trans, this.alias});
  
  Artist.fromJson(jsonRes) {
    albumSize = jsonRes['albumSize'];
    id = jsonRes['id'];
    img1v1Id = jsonRes['img1v1Id'];
    musicSize = jsonRes['musicSize'];
    picId = jsonRes['picId'];
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
    return '{"albumSize": $albumSize,"id": $id,"img1v1Id": $img1v1Id,"musicSize": $musicSize,"picId": $picId,"topicPerson": $topicPerson,"followed": $followed,"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"img1v1Id_str": ${img1v1Id_str != null?'${json.encode(img1v1Id_str)}':'null'},"img1v1Url": ${img1v1Url != null?'${json.encode(img1v1Url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picId_str": ${picId_str != null?'${json.encode(picId_str)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"trans": ${trans != null?'${json.encode(trans)}':'null'},"alias": $alias}';
  }
}

class Album {

  int albumSize;
  int id;
  int img1v1Id;
  int musicSize;
  int picId;
  int topicPerson;
  bool followed;
  String briefDesc;
  String img1v1Id_str;
  String img1v1Url;
  String name;
  String picUrl;
  String trans;
  List<List<dynamic>> alias;

  Album.fromParams({this.albumSize, this.id, this.img1v1Id, this.musicSize, this.picId, this.topicPerson, this.followed, this.briefDesc, this.img1v1Id_str, this.img1v1Url, this.name, this.picUrl, this.trans, this.alias});
  
  Album.fromJson(jsonRes) {
    albumSize = jsonRes['albumSize'];
    id = jsonRes['id'];
    img1v1Id = jsonRes['img1v1Id'];
    musicSize = jsonRes['musicSize'];
    picId = jsonRes['picId'];
    topicPerson = jsonRes['topicPerson'];
    followed = jsonRes['followed'];
    briefDesc = jsonRes['briefDesc'];
    img1v1Id_str = jsonRes['img1v1Id_str'];
    img1v1Url = jsonRes['img1v1Url'];
    name = jsonRes['name'];
    picUrl = jsonRes['picUrl'];
    trans = jsonRes['trans'];
    alias = jsonRes['alias'] == null ? null : [];

    for (var aliasItem in alias == null ? [] : jsonRes['alias']){      
  List<dynamic> aliasChild = aliasItem == null ? null : [];
    for (var aliasItemItem in aliasChild == null ? [] : aliasItem){
            aliasChild.add(aliasItemItem);
    }
      alias.add(aliasChild);
    }
  }

  @override
  String toString() {
    return '{"albumSize": $albumSize,"id": $id,"img1v1Id": $img1v1Id,"musicSize": $musicSize,"picId": $picId,"topicPerson": $topicPerson,"followed": $followed,"briefDesc": ${briefDesc != null?'${json.encode(briefDesc)}':'null'},"img1v1Id_str": ${img1v1Id_str != null?'${json.encode(img1v1Id_str)}':'null'},"img1v1Url": ${img1v1Url != null?'${json.encode(img1v1Url)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"picUrl": ${picUrl != null?'${json.encode(picUrl)}':'null'},"trans": ${trans != null?'${json.encode(trans)}':'null'},"alias": $alias}';
  }
}

