import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'log_util.dart';
part 'dispose_bag.dart';

Future<LoadInitialRouteOutput<T>> loadInitialRoute<T>() async {
  final result = runCatching(
    action: () => GetIt.instance
        .get<BaseLoadInitialRouteUseCase<T>>()
        .execute(const LoadInitialRouteInput()),
  );

  return result.when(
    success: (output) => output,
    failure: (e) => const LoadInitialRouteOutput(),
  );
}
