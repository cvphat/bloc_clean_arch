import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/navigation/app_route_info.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseLoadInitialRouteUseCase)
class LoadInitialRouteUseCase extends BaseLoadInitialRouteUseCase {
  @override
  LoadInitialRouteOutput buildUseCase(
    LoadInitialRouteInput input,
  ) {
    // TODO: Check permission here to pass initial route
    return const LoadInitialRouteOutput(routes: [AppRouteInfo.home()]);
  }
}
