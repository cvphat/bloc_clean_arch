part of 'navigation.dart';

abstract class BaseRouteInfo {
  const BaseRouteInfo();
}

class LoginRouteInfo extends BaseRouteInfo {
  const LoginRouteInfo._();

  factory LoginRouteInfo.login() => const LoginRouteInfo._();
}
