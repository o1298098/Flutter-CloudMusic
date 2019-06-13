import 'package:fish_redux/fish_redux.dart';

class LoginPageState implements Cloneable<LoginPageState> {

  @override
  LoginPageState clone() {
    return LoginPageState();
  }
}

LoginPageState initState(Map<String, dynamic> args) {
  return LoginPageState();
}
