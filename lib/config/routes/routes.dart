import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: BottomTabBarNavigationRoute.page,
            initial: true,
            children: [
              AutoRoute(page: HomeRoute.page),
              AutoRoute(page: BookmarksRoute.page),
              AutoRoute(page: SearchRoute.page),
            ]),
        AutoRoute(page: DetailRoute.page),
      ];
}
