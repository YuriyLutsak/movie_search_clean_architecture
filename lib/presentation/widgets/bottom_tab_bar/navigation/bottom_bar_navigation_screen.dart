import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_search/config/routes/routes.gr.dart';

@RoutePage()
class BottomTabBarNavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        SearchRoute(),
        BookmarksRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_add_outlined), label: ''),
            ],
          ),
        );
      },
    );
  }
}
