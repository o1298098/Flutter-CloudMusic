import 'package:fish_redux/fish_redux.dart';

class VideoPageState implements Cloneable<VideoPageState> {

  @override
  VideoPageState clone() {
    return VideoPageState();
  }
}

VideoPageState initState(Map<String, dynamic> args) {
  return VideoPageState();
}
