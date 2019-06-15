import 'package:fish_redux/fish_redux.dart';

class UserPageState implements Cloneable<UserPageState> {

  @override
  UserPageState clone() {
    return UserPageState();
  }
}

UserPageState initState(Map<String, dynamic> args) {
  return UserPageState();
}
