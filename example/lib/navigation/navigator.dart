import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart' as m;
import 'app_popup_info.dart';
import 'routes/app_router.dart';

@LazySingleton(as: BaseNavigator)
class Navigator extends BaseNavigator with LogMixin {
  Navigator(
    this._appRouter,
    this._appPopupInfoMapper,
    this._appRouteInfoMapper,
  );

  final AppRouter _appRouter;
  final BasePopupInfoMapper _appPopupInfoMapper;
  final BaseRouteInfoMapper _appRouteInfoMapper;

  final _shownPopups = <AppPopupInfo, Completer<dynamic>>{};
  final tabRoutes = const [];

  TabsRouter? tabsRouter;

  StackRouter? get _currentTabRouter =>
      tabsRouter?.stackRouterOfIndex(currentBottomTab);

  StackRouter get _currentTabRouterOrRootRouter =>
      _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext =>
      _appRouter.navigatorKey.currentContext!;

  m.BuildContext? get _currentTabRouterContext =>
      _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext =>
      _currentTabRouterContext ?? _rootRouterContext;

  @override
  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  Future<T?> replace<T extends Object?>(BaseRouteInfo routeInfo) {
    _shownPopups.clear();
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replace by $routeInfo');
    }

    return _appRouter.replace<T>(_appRouteInfoMapper.map(routeInfo));
  }

  @override
  Future<T?> showDialog<T extends Object?>(
    BasePopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    if (_shownPopups.containsKey(appPopupInfo)) {
      logD('Dialog $appPopupInfo already shown');

      return _shownPopups[appPopupInfo]!.future.safeCast();
    }
    _shownPopups[appPopupInfo as AppPopupInfo] = Completer<T?>();

    return m.showDialog<T>(
      context: useRootNavigator
          ? _rootRouterContext
          : _currentTabContextOrRootContext,
      builder: (_) => m.PopScope(
        onPopInvoked: (canPop) async {
          logD('Dialog $appPopupInfo dismissed');
          _shownPopups.remove(appPopupInfo);
        },
        child: _appPopupInfoMapper.map(appPopupInfo, this),
      ),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }
}
