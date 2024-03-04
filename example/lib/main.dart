import 'package:auto_route/auto_route.dart';
import 'package:example/app/app_bloc.dart';
import 'package:example/di/di.dart';
import 'package:example/navigation/observer/app_navigator_observer.dart';
import 'package:example/navigation/routes/app_router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'base/page_state.dart';

void main() {
  configureInjection();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends PageState<MainApp, AppBloc> {
  final _appRouter = GetIt.instance.get<AppRouter>();

  List<PageRouteInfo> _mapRouteToPageRouteInfo() {
    return [const HomeRoute()];
  }

  @override
  bool get isAppWidget => true;

  @override
  Widget buildPage(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: FlexThemeData.light(
              scheme: FlexScheme.dellGenoa,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 7,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 10,
                blendOnColors: false,
                useTextTheme: true,
                useM2StyleDividerInM3: true,
                alignedDropdown: true,
                useInputDecoratorThemeInDialogs: true,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              // To use the Playground font, add GoogleFonts package and uncomment
              // fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.dellGenoa,
              surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
              blendLevel: 13,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 20,
                useTextTheme: true,
                useM2StyleDividerInM3: true,
                alignedDropdown: true,
                useInputDecoratorThemeInDialogs: true,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
              // To use the Playground font, add GoogleFonts package and uncomment
              // fontFamily: GoogleFonts.notoSans().fontFamily,
            ),
            themeMode: state.themeMode,
            // builder: (context, child) {
            //   final MediaQueryData data = MediaQuery.of(context);

            //   return MediaQuery(
            //     data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            //     child: child ?? const SizedBox.shrink(),
            //   );
            // },
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(
              deepLinkBuilder: (deepLink) {
                return DeepLink(_mapRouteToPageRouteInfo());
              },
              navigatorObservers: () => [AppNavigatorObserver()],
            ),
          );
        },
      ),
    );
  }
}
