import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app_state.dart';
export 'app_state.dart';

part 'app_event.dart';

@LazySingleton()
@LazySingleton(as: BaseAppBloc)
class AppBloc extends BaseAppBloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppThemeChanged>(
      _onAppThemeChanged,
    );
  }

  void _onAppThemeChanged(AppThemeChanged event, Emitter<AppState> emit) async {
    return await runBlocCatching(
      action: () async {
        emit(state.copyWith(themeMode: event.themeMode));
      },
    );
  }
}
