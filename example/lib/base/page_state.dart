import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/app/app_bloc.dart';
import 'package:flutter/material.dart';

abstract class PageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageState<T, B, BaseAppBloc<AppEvent, AppState>> {}
