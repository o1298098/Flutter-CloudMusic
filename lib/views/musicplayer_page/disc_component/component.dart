import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class _DiscComponentState extends ComponentState<DiscState> with SingleTickerProviderStateMixin {}
class DiscComponent extends Component<DiscState> {
   @override
  _DiscComponentState createState() => _DiscComponentState();
  DiscComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiscState>(
                adapter: null,
                slots: <String, Dependent<DiscState>>{
                }),);

}
