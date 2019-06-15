import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class PersonalizedState implements Cloneable<PersonalizedState> {

PersonalizedModel personalizedModel;

  @override
  PersonalizedState clone() {
    return PersonalizedState();
  }
}

PersonalizedState initState(Map<String, dynamic> args) {
  return PersonalizedState();
}

class PersonalizedConnector
    extends ConnOp<DiscoverPageState, PersonalizedState> {
  @override
  PersonalizedState get(DiscoverPageState state) {
    PersonalizedState personalizedState = PersonalizedState();
    personalizedState.personalizedModel = state.pageModel.personalizedModel;
    return personalizedState;
  }
}
