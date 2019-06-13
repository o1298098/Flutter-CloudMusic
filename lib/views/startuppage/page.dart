import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class StartUpPagePage extends Page<StartUpPageState, Map<String, dynamic>> {
  StartUpPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<StartUpPageState>(
                adapter: null,
                slots: <String, Dependent<StartUpPageState>>{
                }),
            middleware: <Middleware<StartUpPageState>>[
            ],);

}
