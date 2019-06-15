import 'package:fish_redux/fish_redux.dart';


import 'state.dart';
import 'view.dart';

class ImageSwiperComponent extends Component<ImageSwiperState> {
  ImageSwiperComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<ImageSwiperState>(
                adapter: null,
                slots: <String, Dependent<ImageSwiperState>>{
                }),);

}
