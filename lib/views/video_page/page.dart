import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VideoPagePage extends Page<VideoPageState, Map<String, dynamic>> {
  VideoPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VideoPageState>(
                adapter: null,
                slots: <String, Dependent<VideoPageState>>{
                }),
            middleware: <Middleware<VideoPageState>>[
            ],);

}
