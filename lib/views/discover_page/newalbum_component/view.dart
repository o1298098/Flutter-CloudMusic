import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
    NewAlbumState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildCell(NewAlbum d) {
    return new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new ClipRRect(
            child: CachedNetworkImage(
              placeholder: (context, url) => new Container(
                    color: Colors.grey[400],
                  ),
              imageUrl: d.picUrl,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        new Text(d.name,
            overflow: TextOverflow.clip,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
              fontSize: Adapt.px(24),
            ))
      ],
    ));
  }

  return new Container(
    padding: const EdgeInsets.only(left: 15.0, right: 15),
    child: new GridView.count(
      physics: new NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      semanticChildCount: 3,
      childAspectRatio: 5 / 7,
      padding: const EdgeInsets.all(4.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: state.newAlbumModel == null
          ? <Widget>[]
          : state.newAlbumModel.albums.map(_buildCell).toList(),
      shrinkWrap: true,
    ),
  );
}
