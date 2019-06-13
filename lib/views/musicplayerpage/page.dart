import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MusicPlayerPagePage extends Page<MusicPlayerPageState, Map<String, dynamic>> {
  MusicPlayerPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MusicPlayerPageState>(
                adapter: null,
                slots: <String, Dependent<MusicPlayerPageState>>{
                }),
            middleware: <Middleware<MusicPlayerPageState>>[
            ],);

}
