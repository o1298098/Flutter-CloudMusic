import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Effect<PersonalizedState> buildEffect() {
  return combineEffects(<Object, Effect<PersonalizedState>>{
    PersonalizedAction.action: _onAction,
    PersonalizedAction.celltap:_onCellTaped
  });
}

void _onAction(Action action, Context<PersonalizedState> ctx) {
}
void _onCellTaped(Action action, Context<PersonalizedState> ctx) async{
   await Navigator.of(ctx.context).pushNamed('playlist', arguments: {'id':action.payload});
}
