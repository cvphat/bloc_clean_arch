import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_route_info.freezed.dart';

@freezed
class AppRouteInfo extends BaseRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.home() = _Home;
}
