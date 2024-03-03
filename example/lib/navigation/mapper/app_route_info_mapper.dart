import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/navigation/app_route_info.dart';
import 'package:example/navigation/routes/app_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(BaseRouteInfo routeInfo) {
    if (routeInfo is LoginRouteInfo) {
      // return Login
      // TODO: Return login route
    }
    final appRouteInfo = routeInfo as AppRouteInfo;
    return appRouteInfo.when(
      home: () => const HomeRoute(),
    );
  }
}
