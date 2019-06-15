import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PersonalizedComponent extends Component<PersonalizedState> {
  PersonalizedComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PersonalizedState>(
                adapter: null,
                slots: <String, Dependent<PersonalizedState>>{
                }),);

}
