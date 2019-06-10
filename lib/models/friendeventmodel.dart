part of model;

class FriendEventModel {

  int code;
  int lasttime;
  bool more;
  List<FriendEventData> event;

  FriendEventModel.fromParams({this.code, this.lasttime, this.more, this.event});

  factory FriendEventModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new FriendEventModel.fromJson(json.decode(jsonStr)) : new FriendEventModel.fromJson(jsonStr);
  
  FriendEventModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    lasttime = jsonRes['lasttime'];
    more = jsonRes['more'];
    event = jsonRes['event'] == null ? null : [];

    for (var eventItem in event == null ? [] : jsonRes['event']){
            event.add(eventItem == null ? null : new FriendEventData.fromJson(eventItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"lasttime": $lasttime,"more": $more,"event": $event}';
  }
}

class FriendEventData {

  Object actName;
  Object lotteryEventData;
  int actId;
  int eventTime;
  int expireTime;
  int forwardCount;
  int id;
  int insiteForwardCount;
  int showTime;
  int tmplId;
  int type;
  bool topEvent;
  FriendEventJsonstrModel jsonstr;
  String uuid;
  List<PicData> pics;
  InfoData info;
  RcmdInfo rcmdInfo;
  UserData user;

  FriendEventData.fromParams({this.actName, this.lotteryEventData, this.actId, this.eventTime, this.expireTime, this.forwardCount, this.id, this.insiteForwardCount, this.showTime, this.tmplId, this.type, this.topEvent, this.jsonstr, this.uuid, this.pics, this.info, this.rcmdInfo, this.user});
  
  FriendEventData.fromJson(jsonRes) {
    actName = jsonRes['actName'];
    lotteryEventData = jsonRes['lotteryEventData'];
    actId = jsonRes['actId'];
    eventTime = jsonRes['eventTime'];
    expireTime = jsonRes['expireTime'];
    forwardCount = jsonRes['forwardCount'];
    id = jsonRes['id'];
    insiteForwardCount = jsonRes['insiteForwardCount'];
    showTime = jsonRes['showTime'];
    tmplId = jsonRes['tmplId'];
    type = jsonRes['type'];
    topEvent = jsonRes['topEvent'];
    uuid = jsonRes['uuid'];
    pics = jsonRes['pics'] == null ? null : [];

    for (var picsItem in pics == null ? [] : jsonRes['pics']){
            pics.add(picsItem == null ? null : new PicData.fromJson(picsItem));
    }

    info = jsonRes['info'] == null ? null : new InfoData.fromJson(jsonRes['info']);
    rcmdInfo = jsonRes['rcmdInfo'] == null ? null : new RcmdInfo.fromJson(jsonRes['rcmdInfo']);
    user = jsonRes['user'] == null ? null : new UserData.fromJson(jsonRes['user']);
    jsonstr =jsonRes['json'] == null ? null : new FriendEventJsonstrModel(jsonRes['json'].toString().replaceAll(new RegExp('\"'), '"'));
  }

  @override
  String toString() {
    return '{"actName": $actName,"lotteryEventData": $lotteryEventData,"actId": $actId,"eventTime": $eventTime,"expireTime": $expireTime,"forwardCount": $forwardCount,"id": $id,"insiteForwardCount": $insiteForwardCount,"showTime": $showTime,"tmplId": $tmplId,"type": $type,"topEvent": $topEvent,"json": $jsonstr,"uuid": ${uuid != null?'${json.encode(uuid)}':'null'},"pics": $pics,"info": $info,"rcmdInfo": $rcmdInfo,"user": $user}';
  }
}

class UserData {

  Object remarkName;
  int accountStatus;
  int authStatus;
  int authority;
  int avatarImgId;
  int backgroundImgId;
  int birthday;
  int city;
  int djStatus;
  int followeds;
  int gender;
  int province;
  int userId;
  int userType;
  int vipType;
  bool defaultAvatar;
  bool followed;
  bool mutual;
  bool urlAnalyze;
  String avatarImgIdStr;
  String avatarImgId_str;
  String avatarUrl;
  String backgroundImgIdStr;
  String backgroundUrl;
  String description;
  String detailDescription;
  String nickname;
  String signature;
  List<String> expertTags;
  Experts experts;

  UserData.fromParams({this.remarkName, this.accountStatus, this.authStatus, this.authority, this.avatarImgId, this.backgroundImgId, this.birthday, this.city, this.djStatus, this.followeds, this.gender, this.province, this.userId, this.userType, this.vipType, this.defaultAvatar, this.followed, this.mutual, this.urlAnalyze, this.avatarImgIdStr, this.avatarImgId_str, this.avatarUrl, this.backgroundImgIdStr, this.backgroundUrl, this.description, this.detailDescription, this.nickname, this.signature, this.expertTags, this.experts});
  
  UserData.fromJson(jsonRes) {
    remarkName = jsonRes['remarkName'];
    accountStatus = jsonRes['accountStatus'];
    authStatus = jsonRes['authStatus'];
    authority = jsonRes['authority'];
    avatarImgId = jsonRes['avatarImgId'];
    backgroundImgId = jsonRes['backgroundImgId'];
    birthday = jsonRes['birthday'];
    city = jsonRes['city'];
    djStatus = jsonRes['djStatus'];
    followeds = jsonRes['followeds'];
    gender = jsonRes['gender'];
    province = jsonRes['province'];
    userId = jsonRes['userId'];
    userType = jsonRes['userType'];
    vipType = jsonRes['vipType'];
    defaultAvatar = jsonRes['defaultAvatar'];
    followed = jsonRes['followed'];
    mutual = jsonRes['mutual'];
    urlAnalyze = jsonRes['urlAnalyze'];
    avatarImgIdStr = jsonRes['avatarImgIdStr'];
    avatarImgId_str = jsonRes['avatarImgId_str'];
    avatarUrl = jsonRes['avatarUrl'];
    backgroundImgIdStr = jsonRes['backgroundImgIdStr'];
    backgroundUrl = jsonRes['backgroundUrl'];
    description = jsonRes['description'];
    detailDescription = jsonRes['detailDescription'];
    nickname = jsonRes['nickname'];
    signature = jsonRes['signature'];
    expertTags = jsonRes['expertTags'] == null ? null : [];

    for (var expertTagsItem in expertTags == null ? [] : jsonRes['expertTags']){
            expertTags.add(expertTagsItem);
    }

    experts = jsonRes['experts'] == null ? null : new Experts.fromJson(jsonRes['experts']);
  }

  @override
  String toString() {
    return '{"remarkName": $remarkName,"accountStatus": $accountStatus,"authStatus": $authStatus,"authority": $authority,"avatarImgId": $avatarImgId,"backgroundImgId": $backgroundImgId,"birthday": $birthday,"city": $city,"djStatus": $djStatus,"followeds": $followeds,"gender": $gender,"province": $province,"userId": $userId,"userType": $userType,"vipType": $vipType,"defaultAvatar": $defaultAvatar,"followed": $followed,"mutual": $mutual,"urlAnalyze": $urlAnalyze,"avatarImgIdStr": ${avatarImgIdStr != null?'${json.encode(avatarImgIdStr)}':'null'},"avatarImgId_str": ${avatarImgId_str != null?'${json.encode(avatarImgId_str)}':'null'},"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"backgroundImgIdStr": ${backgroundImgIdStr != null?'${json.encode(backgroundImgIdStr)}':'null'},"backgroundUrl": ${backgroundUrl != null?'${json.encode(backgroundUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"detailDescription": ${detailDescription != null?'${json.encode(detailDescription)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'},"signature": ${signature != null?'${json.encode(signature)}':'null'},"expertTags": $expertTags,"experts": $experts}';
  }
}

class Experts {

  String two;

  Experts.fromParams({this.two});
  
  Experts.fromJson(jsonRes) {
    two = jsonRes['2'];
  }

  @override
  String toString() {
    return '{"2": ${two != null?'${json.encode(two)}':'null'}}';
  }
}

class RcmdInfo {

  int type;
  String alg;
  String reason;
  String scene;
  String userReason;

  RcmdInfo.fromParams({this.type, this.alg, this.reason, this.scene, this.userReason});
  
  RcmdInfo.fromJson(jsonRes) {
    type = jsonRes['type'];
    alg = jsonRes['alg'];
    reason = jsonRes['reason'];
    scene = jsonRes['scene'];
    userReason = jsonRes['userReason'];
  }

  @override
  String toString() {
    return '{"type": $type,"alg": ${alg != null?'${json.encode(alg)}':'null'},"reason": ${reason != null?'${json.encode(reason)}':'null'},"scene": ${scene != null?'${json.encode(scene)}':'null'},"userReason": ${userReason != null?'${json.encode(userReason)}':'null'}}';
  }
}

class InfoData {

  Object comments;
  Object latestLikedUsers;
  int commentCount;
  int likedCount;
  int resourceId;
  int resourceType;
  int shareCount;
  bool liked;
  String threadId;
  CommentThread commentThread;

  InfoData.fromParams({this.comments, this.latestLikedUsers, this.commentCount, this.likedCount, this.resourceId, this.resourceType, this.shareCount, this.liked, this.threadId, this.commentThread});
  
  InfoData.fromJson(jsonRes) {
    comments = jsonRes['comments'];
    latestLikedUsers = jsonRes['latestLikedUsers'];
    commentCount = jsonRes['commentCount'];
    likedCount = jsonRes['likedCount'];
    resourceId = jsonRes['resourceId'];
    resourceType = jsonRes['resourceType'];
    shareCount = jsonRes['shareCount'];
    liked = jsonRes['liked'];
    threadId = jsonRes['threadId'];
    commentThread = jsonRes['commentThread'] == null ? null : new CommentThread.fromJson(jsonRes['commentThread']);
  }

  @override
  String toString() {
    return '{"comments": $comments,"latestLikedUsers": $latestLikedUsers,"commentCount": $commentCount,"likedCount": $likedCount,"resourceId": $resourceId,"resourceType": $resourceType,"shareCount": $shareCount,"liked": $liked,"threadId": ${threadId != null?'${json.encode(threadId)}':'null'},"commentThread": $commentThread}';
  }
}

class CommentThread {

  int commentCount;
  int hotCount;
  int likedCount;
  int resourceId;
  int resourceOwnerId;
  int resourceType;
  int shareCount;
  String id;
  String resourceTitle;
  List<LatestLikedUser> latestLikedUsers;
  ResourceInfo resourceInfo;

  CommentThread.fromParams({this.commentCount, this.hotCount, this.likedCount, this.resourceId, this.resourceOwnerId, this.resourceType, this.shareCount, this.id, this.resourceTitle, this.latestLikedUsers, this.resourceInfo});
  
  CommentThread.fromJson(jsonRes) {
    commentCount = jsonRes['commentCount'];
    hotCount = jsonRes['hotCount'];
    likedCount = jsonRes['likedCount'];
    resourceId = jsonRes['resourceId'];
    resourceOwnerId = jsonRes['resourceOwnerId'];
    resourceType = jsonRes['resourceType'];
    shareCount = jsonRes['shareCount'];
    id = jsonRes['id'];
    resourceTitle = jsonRes['resourceTitle'];
    latestLikedUsers = jsonRes['latestLikedUsers'] == null ? null : [];

    for (var latestLikedUsersItem in latestLikedUsers == null ? [] : jsonRes['latestLikedUsers']){
            latestLikedUsers.add(latestLikedUsersItem == null ? null : new LatestLikedUser.fromJson(latestLikedUsersItem));
    }

    resourceInfo = jsonRes['resourceInfo'] == null ? null : new ResourceInfo.fromJson(jsonRes['resourceInfo']);
  }

  @override
  String toString() {
    return '{"commentCount": $commentCount,"hotCount": $hotCount,"likedCount": $likedCount,"resourceId": $resourceId,"resourceOwnerId": $resourceOwnerId,"resourceType": $resourceType,"shareCount": $shareCount,"id": ${id != null?'${json.encode(id)}':'null'},"resourceTitle": ${resourceTitle != null?'${json.encode(resourceTitle)}':'null'},"latestLikedUsers": $latestLikedUsers,"resourceInfo": $resourceInfo}';
  }
}

class ResourceInfo {

  Object creator;
  Object imgUrl;
  int eventType;
  int id;
  int userId;
  String name;

  ResourceInfo.fromParams({this.creator, this.imgUrl, this.eventType, this.id, this.userId, this.name});
  
  ResourceInfo.fromJson(jsonRes) {
    creator = jsonRes['creator'];
    imgUrl = jsonRes['imgUrl'];
    eventType = jsonRes['eventType'];
    id = jsonRes['id'];
    userId = jsonRes['userId'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"creator": $creator,"imgUrl": $imgUrl,"eventType": $eventType,"id": $id,"userId": $userId,"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

class LatestLikedUser {

  int s;
  int t;

  LatestLikedUser.fromParams({this.s, this.t});
  
  LatestLikedUser.fromJson(jsonRes) {
    s = jsonRes['s'];
    t = jsonRes['t'];
  }

  @override
  String toString() {
    return '{"s": $s,"t": $t}';
  }
}

class PicData {

  int height;
  int width;
  String format;
  String originUrl;
  String pcRectangleUrl;
  String pcSquareUrl;
  String rectangleUrl;
  String squareUrl;

  PicData.fromParams({this.height, this.width, this.format, this.originUrl, this.pcRectangleUrl, this.pcSquareUrl, this.rectangleUrl, this.squareUrl});
  
  PicData.fromJson(jsonRes) {
    height = jsonRes['height'];
    width = jsonRes['width'];
    format = jsonRes['format'];
    originUrl = jsonRes['originUrl'];
    pcRectangleUrl = jsonRes['pcRectangleUrl'];
    pcSquareUrl = jsonRes['pcSquareUrl'];
    rectangleUrl = jsonRes['rectangleUrl'];
    squareUrl = jsonRes['squareUrl'];
  }

  @override
  String toString() {
    return '{"height": $height,"width": $width,"format": ${format != null?'${json.encode(format)}':'null'},"originUrl": ${originUrl != null?'${json.encode(originUrl)}':'null'},"pcRectangleUrl": ${pcRectangleUrl != null?'${json.encode(pcRectangleUrl)}':'null'},"pcSquareUrl": ${pcSquareUrl != null?'${json.encode(pcSquareUrl)}':'null'},"rectangleUrl": ${rectangleUrl != null?'${json.encode(rectangleUrl)}':'null'},"squareUrl": ${squareUrl != null?'${json.encode(squareUrl)}':'null'}}';
  }
}

