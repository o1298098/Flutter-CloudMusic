part of model;

class AccountDetailModel {

  int code;
  int createDays;
  int createTime;
  int level;
  int listenSongs;
  bool adValid;
  bool mobileSign;
  bool pcSign;
  bool peopleCanSeeMyPlayRecord;
  List<Binding> bindings;
  Profile profile;
  UserPoint userPoint;

  AccountDetailModel.fromParams({this.code, this.createDays, this.createTime, this.level, this.listenSongs, this.adValid, this.mobileSign, this.pcSign, this.peopleCanSeeMyPlayRecord, this.bindings, this.profile, this.userPoint});

  factory AccountDetailModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new AccountDetailModel.fromJson(json.decode(jsonStr)) : new AccountDetailModel.fromJson(jsonStr);
  
  AccountDetailModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    createDays = jsonRes['createDays'];
    createTime = jsonRes['createTime'];
    level = jsonRes['level'];
    listenSongs = jsonRes['listenSongs'];
    adValid = jsonRes['adValid'];
    mobileSign = jsonRes['mobileSign'];
    pcSign = jsonRes['pcSign'];
    peopleCanSeeMyPlayRecord = jsonRes['peopleCanSeeMyPlayRecord'];
    bindings = jsonRes['bindings'] == null ? null : [];

    for (var bindingsItem in bindings == null ? [] : jsonRes['bindings']){
            bindings.add(bindingsItem == null ? null : new Binding.fromJson(bindingsItem));
    }

    profile = jsonRes['profile'] == null ? null : new Profile.fromJson(jsonRes['profile']);
    userPoint = jsonRes['userPoint'] == null ? null : new UserPoint.fromJson(jsonRes['userPoint']);
  }

  @override
  String toString() {
    return '{"code": $code,"createDays": $createDays,"createTime": $createTime,"level": $level,"listenSongs": $listenSongs,"adValid": $adValid,"mobileSign": $mobileSign,"pcSign": $pcSign,"peopleCanSeeMyPlayRecord": $peopleCanSeeMyPlayRecord,"bindings": $bindings,"profile": $profile,"userPoint": $userPoint}';
  }
}

class UserPoint {

  int balance;
  int blockBalance;
  int status;
  int updateTime;
  int userId;
  int version;

  UserPoint.fromParams({this.balance, this.blockBalance, this.status, this.updateTime, this.userId, this.version});
  
  UserPoint.fromJson(jsonRes) {
    balance = jsonRes['balance'];
    blockBalance = jsonRes['blockBalance'];
    status = jsonRes['status'];
    updateTime = jsonRes['updateTime'];
    userId = jsonRes['userId'];
    version = jsonRes['version'];
  }

  @override
  String toString() {
    return '{"balance": $balance,"blockBalance": $blockBalance,"status": $status,"updateTime": $updateTime,"userId": $userId,"version": $version}';
  }
}

