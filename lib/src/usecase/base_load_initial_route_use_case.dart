import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class BaseLoadInitialRouteUseCase<T>
    extends BaseSyncUseCase<LoadInitialRouteInput, LoadInitialRouteOutput<T>> {
  @protected
  @override
  LoadInitialRouteOutput<T> buildUseCase(LoadInitialRouteInput input);
}

class LoadInitialRouteInput extends BaseInput {
  const LoadInitialRouteInput();
}

class LoadInitialRouteOutput<T> extends BaseOutput {
  final List<T> routes;
  const LoadInitialRouteOutput({this.routes = const []});
}
