import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FriendEventPagePage extends Page<FriendEventPageState, Map<String, dynamic>> {
  FriendEventPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FriendEventPageState>(
                adapter: null,
                slots: <String, Dependent<FriendEventPageState>>{
                }),
            middleware: <Middleware<FriendEventPageState>>[
            ],);

}
