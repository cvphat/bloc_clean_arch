part of 'app_bloc.dart';

abstract class AppEvent extends BaseAppEvent {
  const AppEvent();
}

class ThemeModeEmitted extends AppEvent {
  final ThemeMode themeMode;
  const ThemeModeEmitted({
    required this.themeMode,
  });
}
