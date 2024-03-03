import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_clean_arch/bloc_clean_arch.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const factory HomeState({
    @Default(0) int count,
  }) = _HomeState;
}
