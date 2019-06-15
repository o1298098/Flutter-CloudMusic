import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/counTostr.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PersonalizedState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildCells(PersonalizedData d)
  {
   return new GestureDetector(
              onTap: ()=>dispatch(PersonalizedActionCreator.onCellTap(d.id)),
              child: new Container(
                  child: new Column(
                children: [
                  Stack(children: <Widget>[
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
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      width: 150,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(CountTostr.chage(d.playCount),
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ]),
                  new Text(d.name,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: Adapt.px(24),
                  ))
                ],
              )
              ));
  }
  return new Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: new GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        semanticChildCount: 6,
        childAspectRatio: 5 / 7,
        padding: const EdgeInsets.all(4.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children:state.personalizedModel==null?<Widget>[]: state.personalizedModel.result.map(_buildCells).toList(),
        shrinkWrap: true,
      ),
    );
}
