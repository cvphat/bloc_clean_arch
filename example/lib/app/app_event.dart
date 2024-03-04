part of 'app_bloc.dart';

abstract class AppEvent extends BaseAppEvent {
  const AppEvent();
}

class AppThemeChanged extends AppEvent {
  final ThemeMode themeMode;
  const AppThemeChanged({
    required this.themeMode,
  });
}
