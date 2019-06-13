import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiscoverPagePage extends Page<DiscoverPageState, Map<String, dynamic>> {
  DiscoverPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiscoverPageState>(
                adapter: null,
                slots: <String, Dependent<DiscoverPageState>>{
                }),
            middleware: <Middleware<DiscoverPageState>>[
            ],);

}
