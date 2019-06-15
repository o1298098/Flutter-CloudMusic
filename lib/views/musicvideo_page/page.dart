import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MusicVideoPagePage extends Page<MusicVideoPageState, Map<String, dynamic>> {
  MusicVideoPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MusicVideoPageState>(
                adapter: null,
                slots: <String, Dependent<MusicVideoPageState>>{
                }),
            middleware: <Middleware<MusicVideoPageState>>[
            ],);

}
