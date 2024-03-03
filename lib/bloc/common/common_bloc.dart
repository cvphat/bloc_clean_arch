import 'dart:async';

import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  static final CommonBloc _instance = CommonBloc._();
  late BaseClearUserDataUseCase _clearUserDataUseCase;

  factory CommonBloc(BaseClearUserDataUseCase clearUserDataUseCase) {
    _instance._clearUserDataUseCase = clearUserDataUseCase;
    return _instance;
  }

  CommonBloc._() : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(
      _onLoadingVisibilityEmitted,
      transformer: log(),
    );

    on<ExceptionEmitted>(
      _onExceptionEmitted,
      transformer: log(),
    );

    on<ForceLogoutButtonPressed>(
      _onForceLogoutButtonPressed,
      transformer: log(),
    );
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: state.loadingCount == 0 && event.isLoading
            ? true
            : state.loadingCount == 1 && !event.isLoading ||
                    state.loadingCount <= 0
                ? false
                : state.isLoading,
        loadingCount: event.isLoading
            ? state.loadingCount.plus(1)
            : state.loadingCount.minus(1),
      ),
    );
  }

  FutureOr<void> _onExceptionEmitted(
      ExceptionEmitted event, Emitter<CommonState> emit) {
    emit(
      state.copyWith(
        exceptionWrapper: event.exceptionWrapper,
      ),
    );
  }

  Future<void> _onForceLogoutButtonPressed(
    ForceLogoutButtonPressed event,
    Emitter<CommonState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _clearUserDataUseCase.execute(
          const ClearUserDataInput(),
        );
        await navigator.replace(LoginRouteInfo.login());
      },
    );
  }
}
