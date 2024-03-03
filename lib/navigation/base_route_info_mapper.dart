part of 'navigation.dart';

abstract class BaseRouteInfoMapper {
  PageRouteInfo map(BaseRouteInfo routeInfo);

  List<PageRouteInfo> mapList(List<BaseRouteInfo> listRouteInfo) {
    return listRouteInfo.map(map).toList(growable: false);
  }
}
