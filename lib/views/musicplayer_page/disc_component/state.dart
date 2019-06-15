import 'package:fish_redux/fish_redux.dart';

class DiscState implements Cloneable<DiscState> {

  @override
  DiscState clone() {
    return DiscState();
  }
}

DiscState initState(Map<String, dynamic> args) {
  return DiscState();
}
