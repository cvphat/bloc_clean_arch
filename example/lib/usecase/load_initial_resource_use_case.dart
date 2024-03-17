import 'package:auto_route/auto_route.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/navigation/routes/app_router.dart';
import 'package:example/navigation/routes/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseLoadInitialRouteUseCase<PageRouteInfo>)
class LoadInitialRouteUseCase
    extends BaseLoadInitialRouteUseCase<PageRouteInfo> {
  @override
  LoadInitialRouteOutput<PageRouteInfo> buildUseCase(
      LoadInitialRouteInput input) {
    // TODO: Check permission here to pass initial route
    return const LoadInitialRouteOutput(routes: [LoginRoute()]);
  }
}
