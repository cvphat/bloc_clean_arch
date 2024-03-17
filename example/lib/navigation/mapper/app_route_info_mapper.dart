import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/navigation/app_route_info.dart';
import 'package:example/navigation/routes/app_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper<PageRouteInfo> {
  @override
  PageRouteInfo map(BaseRouteInfo routeInfo) {
    if (routeInfo is LoginRouteInfo) {
      return const LoginRoute();
    }
    final appRouteInfo = routeInfo as AppRouteInfo;
    return appRouteInfo.when(
      home: () => const HomeRoute(),
    );
  }
}
