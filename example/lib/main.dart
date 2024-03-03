import 'package:auto_route/auto_route.dart';
import 'package:example/di/di.dart';
import 'package:example/navigation/observer/app_navigator_observer.dart';
import 'package:example/navigation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureInjection();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = GetIt.instance.get<AppRouter>();

  List<PageRouteInfo> _mapRouteToPageRouteInfo() {
    return [const HomeRoute()];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (deepLink) {
          return DeepLink(_mapRouteToPageRouteInfo());
        },
        navigatorObservers: () => [AppNavigatorObserver()],
      ),
    );
  }
}
