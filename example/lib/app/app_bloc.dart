import 'package:bloc_clean_arch/bloc/app/base_app_bloc.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton(as: BaseAppBloc<AppEvent, AppState>)
class AppBloc extends BaseAppBloc<AppEvent, AppState> {
  AppBloc(super.initialState);
}
