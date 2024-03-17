// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:bloc_clean_arch/bloc_clean_arch.dart' as _i5;
import 'package:example/app/app_bloc.dart' as _i3;
import 'package:example/exceptions/exception_handler.dart' as _i7;
import 'package:example/exceptions/exception_mapper.dart' as _i8;
import 'package:example/navigation/mapper/app_popup_info_mapper.dart' as _i9;
import 'package:example/navigation/mapper/app_route_info_mapper.dart' as _i11;
import 'package:example/navigation/navigator.dart' as _i14;
import 'package:example/navigation/routes/app_router.dart' as _i4;
import 'package:example/ui/home/bloc/home_bloc.dart' as _i12;
import 'package:example/ui/login/bloc/login_bloc.dart' as _i13;
import 'package:example/usecase/clear_user_data_use_case.dart' as _i6;
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
    gh.lazySingleton<_i3.AppBloc>(() => _i3.AppBloc());
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.lazySingleton<_i5.BaseClearUserDataUseCase>(
        () => _i6.ClearUserDataUseCase());
    gh.lazySingleton<_i5.BaseExceptionHandler>(() => _i7.ExceptionHandler());
    gh.lazySingleton<_i5.BaseExceptionMapper>(() => _i8.ExceptionMapper());
    gh.lazySingleton<_i5.BasePopupInfoMapper>(() => _i9.AppPopupInfoMapper());
    gh.lazySingleton<_i5.BaseRouteInfoMapper<_i10.PageRouteInfo<dynamic>>>(
        () => _i11.AppRouteInfoMapper());
    gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc());
    gh.factory<_i13.LoginBloc>(() => _i13.LoginBloc());
    gh.lazySingleton<_i5.BaseNavigator>(() => _i14.Navigator(
          gh<_i4.AppRouter>(),
          gh<_i5.BasePopupInfoMapper>(),
          gh<_i5.BaseRouteInfoMapper<_i10.PageRouteInfo<dynamic>>>(),
        ));
    return this;
  }
}
