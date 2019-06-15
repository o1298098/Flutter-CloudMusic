import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayListPage extends Page<PlayListPageState, Map<String, dynamic>> {
  PlayListPage()
      : super(
            initState: initPlayListPageState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayListPageState>(
                adapter: null,
                slots: <String, Dependent<PlayListPageState>>{
                }),
            middleware: <Middleware<PlayListPageState>>[
            ],);

}
