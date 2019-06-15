import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class NewAlbumComponent extends Component<NewAlbumState> {
  NewAlbumComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<NewAlbumState>(
                adapter: null,
                slots: <String, Dependent<NewAlbumState>>{
                }),);

}
