import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:bloc_clean_arch/bloc/base_bloc_delegate.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}
