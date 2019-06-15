import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudmusic/actions/Adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'state.dart';

Widget buildView(
    ImageSwiperState state, Dispatch dispatch, ViewService viewService) {
  Widget getImage(int index) {
    if (state.bannerdata != null) {
      return new Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: new ClipRRect(
            child: CachedNetworkImage(
              placeholder: (context, url) => new Container(
                    color: Colors.grey[400],
                  ),
              imageUrl: state.bannerdata.banners[index].imageUrl,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
      );
    } else {
      return new ClipRRect(
          child: CachedNetworkImage(
            placeholder: (context, url) => new Container(
                  color: Colors.grey[400],
                ),
            imageUrl: state.url,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ));
    }
  }

  return Container(
    height: Adapt.px(250),
    margin: EdgeInsets.only(bottom: 15),
    child: new Swiper(
        viewportFraction: 0.9999,
        autoplay: true,
        loop: true,
        pagination: new SwiperPagination(
            builder: new DotSwiperPaginationBuilder(activeColor: Colors.red)),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return getImage(index);
        }),
  );
}
