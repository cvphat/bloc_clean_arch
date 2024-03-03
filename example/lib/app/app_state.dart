import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState extends BaseAppState with _$AppState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppState;
}
