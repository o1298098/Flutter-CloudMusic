import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserPagePage extends Page<UserPageState, Map<String, dynamic>> {
  UserPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserPageState>(
                adapter: null,
                slots: <String, Dependent<UserPageState>>{
                }),
            middleware: <Middleware<UserPageState>>[
            ],);

}
