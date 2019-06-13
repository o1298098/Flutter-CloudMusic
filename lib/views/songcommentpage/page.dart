import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SongCommentPagePage extends Page<SongCommentPageState, Map<String, dynamic>> {
  SongCommentPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SongCommentPageState>(
                adapter: null,
                slots: <String, Dependent<SongCommentPageState>>{
                }),
            middleware: <Middleware<SongCommentPageState>>[
            ],);

}
