import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

part 'home_event.dart';

@LazySingleton()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Plus1Emitted>(
      plus1,
      transformer: log(),
    );
  }

  Future<void> plus1(Plus1Emitted event, emit) async {
    return await runBlocCatching(
      action: () async {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(count: state.count + 1));
        throw AppUncaughtException('Error with count ${state.count}');
      },
    );
  }
}
