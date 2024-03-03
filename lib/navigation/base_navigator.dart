part of 'navigation.dart';

abstract class BaseNavigator {
  bool get canPopSelfOrChildren;

  int get currentBottomTab;

  Future<T?> replace<T extends Object?>(BaseRouteInfo routeInfo);

  Future<T?> showDialog<T extends Object?>(
    BasePopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  });
}
