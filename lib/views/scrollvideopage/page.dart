import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ScrollVideoPagePage extends Page<ScrollVideoPageState, Map<String, dynamic>> {
  ScrollVideoPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ScrollVideoPageState>(
                adapter: null,
                slots: <String, Dependent<ScrollVideoPageState>>{
                }),
            middleware: <Middleware<ScrollVideoPageState>>[
            ],);

}
