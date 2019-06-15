import 'package:cloudmusic/views/discover_page/imageswiper_component/component.dart';
import 'package:cloudmusic/views/discover_page/newalbum_component/component.dart';
import 'package:cloudmusic/views/discover_page/personalized_component/component.dart';
import 'package:cloudmusic/views/discover_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'imageswiper_component/state.dart' as imageswiper;
import 'personalized_component/state.dart' as personalized;
import 'newalbum_component/state.dart' as newalbum;
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiscoverPage extends Page<DiscoverPageState, Map<String, dynamic>> {
  DiscoverPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiscoverPageState>(
                adapter: null,
                slots: <String, Dependent<DiscoverPageState>>{
                  'imageswiper':ImageSwiperComponent().asDependent(imageswiper.ImageSwiperConnector()),
                  'personalized':PersonalizedComponent().asDependent(personalized.PersonalizedConnector()),
                  'newalbum':NewAlbumComponent().asDependent(newalbum.PersonalizedConnector()),
                }),
            middleware: <Middleware<DiscoverPageState>>[
            ],);

}
