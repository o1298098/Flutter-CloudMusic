
part of model;
class AccountInfo {

  int code;
  int loginType;
  List<Binding> bindings;
  Account account;
  Profile profile;

  AccountInfo.fromParams({this.code, this.loginType, this.bindings, this.account, this.profile});

  factory AccountInfo(jsonStr) => jsonStr == null ? null : jsonStr is String ? new AccountInfo.fromJson(json.decode(jsonStr)) : new AccountInfo.fromJson(jsonStr);
  
  AccountInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    loginType = jsonRes['loginType'];
    bindings = jsonRes['bindings'] == null ? null : [];

    for (var bindingsItem in bindings == null ? [] : jsonRes['bindings']){
            bindings.add(bindingsItem == null ? null : new Binding.fromJson(bindingsItem));
    }

    account = jsonRes['account'] == null ? null : new Account.fromJson(jsonRes['account']);
    profile = jsonRes['profile'] == null ? null : new Profile.fromJson(jsonRes['profile']);
  }

  @override
  String toString() {
    return '{"code": $code,"loginType": $loginType,"bindings": $bindings,"account": $account,"profile": $profile}';
  }
}

class Profile {

  Object expertTags;
  Object experts;
  Object remarkName;
  int accountStatus;
  int authStatus;
  int authority;
  int avatarImgId;
  int backgroundImgId;
  int birthday;
  int city;
  int djStatus;
  int eventCount;
  int followeds;
  int follows;
  int gender;
  int playlistBeSubscribedCount;
  int playlistCount;
  int province;
  int userId;
  int userType;
  int vipType;
  bool defaultAvatar;
  bool followed;
  bool mutual;
  String avatarImgIdStr;
  String avatarImgId_str;
  String avatarUrl;
  String backgroundImgIdStr;
  String backgroundUrl;
  String description;
  String detailDescription;
  String nickname;
  String signature;

  Profile.fromParams({this.expertTags, this.experts, this.remarkName, this.accountStatus, this.authStatus, this.authority, this.avatarImgId, this.backgroundImgId, this.birthday, this.city, this.djStatus, this.eventCount, this.followeds, this.follows, this.gender, this.playlistBeSubscribedCount, this.playlistCount, this.province, this.userId, this.userType, this.vipType, this.defaultAvatar, this.followed, this.mutual, this.avatarImgIdStr, this.avatarImgId_str, this.avatarUrl, this.backgroundImgIdStr, this.backgroundUrl, this.description, this.detailDescription, this.nickname, this.signature});
  
  Profile.fromJson(jsonRes) {
    expertTags = jsonRes['expertTags'];
    experts = jsonRes['experts'];
    remarkName = jsonRes['remarkName'];
    accountStatus = jsonRes['accountStatus'];
    authStatus = jsonRes['authStatus'];
    authority = jsonRes['authority'];
    avatarImgId = jsonRes['avatarImgId'];
    backgroundImgId = jsonRes['backgroundImgId'];
    birthday = jsonRes['birthday'];
    city = jsonRes['city'];
    djStatus = jsonRes['djStatus'];
    eventCount = jsonRes['eventCount'];
    followeds = jsonRes['followeds'];
    follows = jsonRes['follows'];
    gender = jsonRes['gender'];
    playlistBeSubscribedCount = jsonRes['playlistBeSubscribedCount'];
    playlistCount = jsonRes['playlistCount'];
    province = jsonRes['province'];
    userId = jsonRes['userId'];
    userType = jsonRes['userType'];
    vipType = jsonRes['vipType'];
    defaultAvatar = jsonRes['defaultAvatar'];
    followed = jsonRes['followed'];
    mutual = jsonRes['mutual'];
    avatarImgIdStr = jsonRes['avatarImgIdStr'];
    avatarImgId_str = jsonRes['avatarImgId_str'];
    avatarUrl = jsonRes['avatarUrl'];
    backgroundImgIdStr = jsonRes['backgroundImgIdStr'];
    backgroundUrl = jsonRes['backgroundUrl'];
    description = jsonRes['description'];
    detailDescription = jsonRes['detailDescription'];
    nickname = jsonRes['nickname'];
    signature = jsonRes['signature'];
  }

  @override
  String toString() {
    return '{"expertTags": $expertTags,"experts": $experts,"remarkName": $remarkName,"accountStatus": $accountStatus,"authStatus": $authStatus,"authority": $authority,"avatarImgId": $avatarImgId,"backgroundImgId": $backgroundImgId,"birthday": $birthday,"city": $city,"djStatus": $djStatus,"eventCount": $eventCount,"followeds": $followeds,"follows": $follows,"gender": $gender,"playlistBeSubscribedCount": $playlistBeSubscribedCount,"playlistCount": $playlistCount,"province": $province,"userId": $userId,"userType": $userType,"vipType": $vipType,"defaultAvatar": $defaultAvatar,"followed": $followed,"mutual": $mutual,"avatarImgIdStr": ${avatarImgIdStr != null?'${json.encode(avatarImgIdStr)}':'null'},"avatarImgId_str": ${avatarImgId_str != null?'${json.encode(avatarImgId_str)}':'null'},"avatarUrl": ${avatarUrl != null?'${json.encode(avatarUrl)}':'null'},"backgroundImgIdStr": ${backgroundImgIdStr != null?'${json.encode(backgroundImgIdStr)}':'null'},"backgroundUrl": ${backgroundUrl != null?'${json.encode(backgroundUrl)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"detailDescription": ${detailDescription != null?'${json.encode(detailDescription)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'},"signature": ${signature != null?'${json.encode(signature)}':'null'}}';
  }
}

class Account {

  Object ban;
  int baoyueVersion;
  int createTime;
  int donateVersion;
  int id;
  int status;
  int tokenVersion;
  int type;
  int vipType;
  int viptypeVersion;
  int whitelistAuthority;
  bool anonimousUser;
  String salt;
  String userName;

  Account.fromParams({this.ban, this.baoyueVersion, this.createTime, this.donateVersion, this.id, this.status, this.tokenVersion, this.type, this.vipType, this.viptypeVersion, this.whitelistAuthority, this.anonimousUser, this.salt, this.userName});
  
  Account.fromJson(jsonRes) {
    ban = jsonRes['ban'];
    baoyueVersion = jsonRes['baoyueVersion'];
    createTime = jsonRes['createTime'];
    donateVersion = jsonRes['donateVersion'];
    id = jsonRes['id'];
    status = jsonRes['status'];
    tokenVersion = jsonRes['tokenVersion'];
    type = jsonRes['type'];
    vipType = jsonRes['vipType'];
    viptypeVersion = jsonRes['viptypeVersion'];
    whitelistAuthority = jsonRes['whitelistAuthority'];
    anonimousUser = jsonRes['anonimousUser'];
    salt = jsonRes['salt'];
    userName = jsonRes['userName'];
  }

  @override
  String toString() {
    return '{"ban": $ban,"baoyueVersion": $baoyueVersion,"createTime": $createTime,"donateVersion": $donateVersion,"id": $id,"status": $status,"tokenVersion": $tokenVersion,"type": $type,"vipType": $vipType,"viptypeVersion": $viptypeVersion,"whitelistAuthority": $whitelistAuthority,"anonimousUser": $anonimousUser,"salt": ${salt != null?'${json.encode(salt)}':'null'},"userName": ${userName != null?'${json.encode(userName)}':'null'}}';
  }
}

class Binding {

  int bindingTime;
  int expiresIn;
  int id;
  int refreshTime;
  int type;
  int userId;
  bool expired;
  String tokenJsonStr;
  String url;

  Binding.fromParams({this.bindingTime, this.expiresIn, this.id, this.refreshTime, this.type, this.userId, this.expired, this.tokenJsonStr, this.url});
  
  Binding.fromJson(jsonRes) {
    bindingTime = jsonRes['bindingTime'];
    expiresIn = jsonRes['expiresIn'];
    id = jsonRes['id'];
    refreshTime = jsonRes['refreshTime'];
    type = jsonRes['type'];
    userId = jsonRes['userId'];
    expired = jsonRes['expired'];
    tokenJsonStr = jsonRes['tokenJsonStr'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"bindingTime": $bindingTime,"expiresIn": $expiresIn,"id": $id,"refreshTime": $refreshTime,"type": $type,"userId": $userId,"expired": $expired,"tokenJsonStr": ${tokenJsonStr != null?'${json.encode(tokenJsonStr)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

