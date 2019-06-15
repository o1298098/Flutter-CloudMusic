import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainPageState>>{
      MainPageAction.action: _onAction,
      MainPageAction.onPageTap:_onPageTap
    },
  );
}
MainPageState _onPageTap(MainPageState state, Action action) {
  final int newint = action.payload ?? 0;
  final MainPageState newState = state.clone();
  newState.selectedIndex = newint;
  return newState;
}
MainPageState _onAction(MainPageState state, Action action) {
  final MainPageState newState = state.clone();
  return newState;
}
