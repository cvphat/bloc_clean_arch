import 'package:bloc_clean_arch/bloc_clean_arch.dart';

part 'base_app_event.dart';
part 'base_app_state.dart';

abstract class BaseAppBloc<E extends BaseAppEvent, S extends BaseAppState>
    extends BaseBloc<E, S> {
  BaseAppBloc(super.initialState);
}
