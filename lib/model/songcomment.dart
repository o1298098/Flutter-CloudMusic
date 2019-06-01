part of model;

class SongCommentModel {

  int code;
  int total;
  int userId;
  bool isMusician;
  bool more;
  bool moreHot;
  List<SongComment> comments;
  List<SongComment> hotComments;
  List<dynamic> topComments;

  SongCommentModel.fromParams({this.code, this.total, this.userId, this.isMusician, this.more, this.moreHot, this.comments, this.hotComments, this.topComments});

  factory SongCommentModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new SongCommentModel.fromJson(json.decode(jsonStr)) : new SongCommentModel.fromJson(jsonStr);
  
  SongCommentModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    total = jsonRes['total'];
    userId = jsonRes['userId'];
    isMusician = jsonRes['isMusician'];
    more = jsonRes['more'];
    moreHot = jsonRes['moreHot'];
    comments = jsonRes['comments'] == null ? null : [];

    for (var commentsItem in comments == null ? [] : jsonRes['comments']){
            comments.add(commentsItem == null ? null : new SongComment.fromJson(commentsItem));
    }

    hotComments = jsonRes['hotComments'] == null ? null : [];

    for (var hotCommentsItem in hotComments == null ? [] : jsonRes['hotComments']){
            hotComments.add(hotCommentsItem == null ? null : new SongComment.fromJson(hotCommentsItem));
    }

    topComments = jsonRes['topComments'] == null ? null : [];

    for (var topCommentsItem in topComments == null ? [] : jsonRes['topComments']){
            topComments.add(topCommentsItem);
    }
  }

  @override
  String toString() {
    return '{"code": $code,"total": $total,"userId": $userId,"isMusician": $isMusician,"more": $more,"moreHot": $moreHot,"comments": $comments,"hotComments": $hotComments,"topComments": $topComments}';
  }
}


class User {

  Object expertTags;
  Object experts;
  Object liveInfo;
  Object locationInfo;
  Object remarkName;
  Object vipRights;
  int authStatus;
  int userId;
  int userType;
  int vipType;
  String avatarUrl;
  String nickname;

  User.fromParams({this.expertTags, this.experts, this.liveInfo, this.locationInfo, this.remarkName, this.vipRights, this.authStatus, this.userId, this.userType, this.vipType, this.avatarUrl, this.nickname});
  
  User.fromJson(jsonRes) {
    expertTags = jsonRes['expertTags'];
    experts = jsonRes['experts'];
    liveInfo = jsonRes['liveInfo'];
    locationInfo = jsonRes['locationInfo'];
    remarkName = jsonRes['remarkName'];
    vipRights = jsonRes['vipRights'];
    authStatus = jsonRes['authStatus'];
    userId = jsonRes['userId'];
    userType = jsonRes['userType'];
    vipType = jsonRes['vipType'];
    avatarUrl = jsonRes['avatarUrl'];
    nickname = jsonRes['nickname'];
  }

  @override
  String toString() {
    return '{"expertTags": $expertTags,"experts": $experts,"liveInfo": $liveInfo,"locationInfo": $locationInfo,"remarkName": $remarkName,"vipRights": $vipRights,"authStatus": $authStatus,"userId": $userId,"userType": $userType,"vipType": $vipType,"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'}}';
  }
}

class SongComment {

  Object decoration;
  Object expressionUrl;
  Object showFloorComment;
  int commentId;
  int commentLocationType;
  int likedCount;
  int parentCommentId;
  int status;
  int time;
  bool liked;
  bool repliedMark;
  String content;
  List<dynamic> beReplied;
  PendantData pendantData;
  User user;

  SongComment.fromParams({this.decoration, this.expressionUrl, this.showFloorComment, this.commentId, this.commentLocationType, this.likedCount, this.parentCommentId, this.status, this.time, this.liked, this.repliedMark, this.content, this.beReplied, this.pendantData, this.user});
  
  SongComment.fromJson(jsonRes) {
    decoration = jsonRes['decoration'];
    expressionUrl = jsonRes['expressionUrl'];
    showFloorComment = jsonRes['showFloorComment'];
    commentId = jsonRes['commentId'];
    commentLocationType = jsonRes['commentLocationType'];
    likedCount = jsonRes['likedCount'];
    parentCommentId = jsonRes['parentCommentId'];
    status = jsonRes['status'];
    time = jsonRes['time'];
    liked = jsonRes['liked'];
    repliedMark = jsonRes['repliedMark'];
    content = jsonRes['content'];
    beReplied = jsonRes['beReplied'] == null ? null : [];

    for (var beRepliedItem in beReplied == null ? [] : jsonRes['beReplied']){
            beReplied.add(beRepliedItem);
    }

    pendantData = jsonRes['pendantData'] == null ? null : new PendantData.fromJson(jsonRes['pendantData']);
    user = jsonRes['user'] == null ? null : new User.fromJson(jsonRes['user']);
  }

  @override
  String toString() {
    return '{"decoration": $decoration,"expressionUrl": $expressionUrl,"showFloorComment": $showFloorComment,"commentId": $commentId,"commentLocationType": $commentLocationType,"likedCount": $likedCount,"parentCommentId": $parentCommentId,"status": $status,"time": $time,"liked": $liked,"repliedMark": $repliedMark,"content": ${content != null?'${json.encode(content)}':'null'},"beReplied": $beReplied,"pendantData": $pendantData,"user": $user}';
  }
}
class VipRights {

  Object musicPackage;
  int redVipAnnualCount;
  Associator associator;

  VipRights.fromParams({this.musicPackage, this.redVipAnnualCount, this.associator});
  
  VipRights.fromJson(jsonRes) {
    musicPackage = jsonRes['musicPackage'];
    redVipAnnualCount = jsonRes['redVipAnnualCount'];
    associator = jsonRes['associator'] == null ? null : new Associator.fromJson(jsonRes['associator']);
  }

  @override
  String toString() {
    return '{"musicPackage": $musicPackage,"redVipAnnualCount": $redVipAnnualCount,"associator": $associator}';
  }
}

class Associator {

  int vipCode;
  bool rights;

  Associator.fromParams({this.vipCode, this.rights});
  
  Associator.fromJson(jsonRes) {
    vipCode = jsonRes['vipCode'];
    rights = jsonRes['rights'];
  }

  @override
  String toString() {
    return '{"vipCode": $vipCode,"rights": $rights}';
  }
}

class PendantData {

  int id;
  String imageUrl;

  PendantData.fromParams({this.id, this.imageUrl});
  
  PendantData.fromJson(jsonRes) {
    id = jsonRes['id'];
    imageUrl = jsonRes['imageUrl'];
  }

  @override
  String toString() {
    return '{"id": $id,"imageUrl": ${imageUrl != null?'${json.encode(imageUrl)}':'null'}}';
  }
}

