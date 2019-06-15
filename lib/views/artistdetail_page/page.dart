import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ArtistDetailPage extends Page<ArtistDetailState, Map<String, dynamic>> {
  ArtistDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ArtistDetailState>(
                adapter: null,
                slots: <String, Dependent<ArtistDetailState>>{
                }),
            middleware: <Middleware<ArtistDetailState>>[
            ],);

}
