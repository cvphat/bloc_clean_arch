import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';
import 'route_guard.dart';

export 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          guards: [
            RouteGuard(),
          ],
        ),
        AutoRoute(page: LoginRoute.page, path: '/login'),
      ];
}
