import 'package:fish_redux/fish_redux.dart';

class AccountPageState implements Cloneable<AccountPageState> {

  @override
  AccountPageState clone() {
    return AccountPageState();
  }
}

AccountPageState initState(Map<String, dynamic> args) {
  return AccountPageState();
}
