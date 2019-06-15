import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/views/discover_page/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ImageSwiperState implements Cloneable<ImageSwiperState> {

  String url ='https://www.lodderoofing.com/wp-content/uploads/2018/04/grass-tips-wind-grey-sky.jpg';
  BannerModel bannerdata;
  @override
  ImageSwiperState clone() {
    return ImageSwiperState();
  }
}
class ImageSwiperConnector
    extends ConnOp<DiscoverPageState, ImageSwiperState> {
  @override
  ImageSwiperState get(DiscoverPageState state) {
    ImageSwiperState imageSwiperState = ImageSwiperState();
    imageSwiperState.bannerdata = state.pageModel.bannerModel;
    return imageSwiperState;
  }
}

ImageSwiperState initState(Map<String, dynamic> args) {
  return ImageSwiperState();
}

