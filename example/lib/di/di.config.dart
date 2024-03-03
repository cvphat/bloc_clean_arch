// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_clean_arch/bloc/app/base_app_bloc.dart' as _i5;
import 'package:bloc_clean_arch/bloc_clean_arch.dart' as _i6;
import 'package:example/app/app_bloc.dart' as _i4;
import 'package:example/exceptions/exception_handler.dart' as _i8;
import 'package:example/exceptions/exception_mapper.dart' as _i9;
import 'package:example/navigation/mapper/app_popup_info_mapper.dart' as _i10;
import 'package:example/navigation/mapper/app_route_info_mapper.dart' as _i11;
import 'package:example/navigation/navigator.dart' as _i13;
import 'package:example/navigation/routes/app_router.dart' as _i3;
import 'package:example/ui/home/bloc/home_bloc.dart' as _i12;
import 'package:example/usecase/clear_user_data_use_case.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.AppState>(() => _i4.AppState());
    gh.lazySingleton<_i5.BaseAppBloc<_i4.AppEvent, _i4.AppState>>(
        () => _i4.AppBloc(gh<_i4.AppState>()));
    gh.lazySingleton<_i6.BaseClearUserDataUseCase>(
        () => _i7.ClearUserDataUseCase());
    gh.lazySingleton<_i6.BaseExceptionHandler>(() => _i8.ExceptionHandler());
    gh.lazySingleton<_i6.BaseExceptionMapper>(() => _i9.ExceptionMapper());
    gh.lazySingleton<_i6.BasePopupInfoMapper>(() => _i10.AppPopupInfoMapper());
    gh.lazySingleton<_i6.BaseRouteInfoMapper>(() => _i11.AppRouteInfoMapper());
    gh.lazySingleton<_i12.HomeBloc>(() => _i12.HomeBloc());
    gh.lazySingleton<_i6.BaseNavigator>(() => _i13.Navigator(
          gh<_i3.AppRouter>(),
          gh<_i6.BasePopupInfoMapper>(),
          gh<_i6.BaseRouteInfoMapper>(),
        ));
    return this;
  }
}
