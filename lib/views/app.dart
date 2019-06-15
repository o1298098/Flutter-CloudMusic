import 'package:cloudmusic/globalbasestate/state.dart';
import 'package:cloudmusic/globalbasestate/store.dart';
import 'package:cloudmusic/views/artistdetail_page/page.dart';
import 'package:cloudmusic/views/discover_page/page.dart';
import 'package:cloudmusic/views/main_page/page.dart';
import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';

import 'playlist_page/page.dart';
//create global page helper
Page<T, dynamic> pageConfiguration<T extends GlobalBaseState<T>>(
    Page<T, dynamic> page) {
  return page

    ///connect with app-store
    ..connectExtraStore(GlobalStore.store, (T pagestate, GlobalState appState) {
      return pagestate.themeColor == appState.themeColor
          ? pagestate
          : ((pagestate.clone())..themeColor = appState.themeColor);
    })

    ///updateMiddleware
    ..updateMiddleware(
      view: (List<ViewMiddleware<T>> viewMiddleware) {
        viewMiddleware.add(safetyView<T>());
      },
      adapter: (List<AdapterMiddleware<T>> adapterMiddleware) {
        adapterMiddleware.add(safetyAdapter<T>());
      },
    );
}

Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'mainpage':pageConfiguration(MainPage()),
        'discoverpage':pageConfiguration(DiscoverPage()),
        'artistdetail': pageConfiguration(ArtistDetailPage()),
        'playlist':pageConfiguration(PlayListPage())
      },
    ),
  ]);

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('mainpage', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}