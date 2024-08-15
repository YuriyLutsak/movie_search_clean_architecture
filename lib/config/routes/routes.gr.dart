// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:movie_search/presentation/pages/bookmarks_page/bookmarks_page.dart'
    as _i1;
import 'package:movie_search/presentation/pages/detail_page/detail_page.dart'
    as _i3;
import 'package:movie_search/presentation/pages/home_page/home_page.dart'
    as _i4;
import 'package:movie_search/presentation/pages/search_page/search_page.dart'
    as _i5;
import 'package:movie_search/presentation/widgets/bottom_tab_bar/navigation/bottom_bar_navigation_screen.dart'
    as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BookmarksRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BookmarksPage(),
      );
    },
    BottomTabBarNavigationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BottomTabBarNavigationScreen(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DetailPage(
          key: args.key,
          filmId: args.filmId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookmarksPage]
class BookmarksRoute extends _i6.PageRouteInfo<void> {
  const BookmarksRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomTabBarNavigationScreen]
class BottomTabBarNavigationRoute extends _i6.PageRouteInfo<void> {
  const BottomTabBarNavigationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomTabBarNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomTabBarNavigationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i7.Key? key,
    required int filmId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            filmId: filmId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i6.PageInfo<DetailRouteArgs> page =
      _i6.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.filmId,
  });

  final _i7.Key? key;

  final int filmId;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, filmId: $filmId}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SearchPage]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
