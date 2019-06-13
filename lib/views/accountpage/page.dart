import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AccountPagePage extends Page<AccountPageState, Map<String, dynamic>> {
  AccountPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AccountPageState>(
                adapter: null,
                slots: <String, Dependent<AccountPageState>>{
                }),
            middleware: <Middleware<AccountPageState>>[
            ],);

}
