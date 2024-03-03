import 'dart:async';

import 'package:bloc_clean_arch/bloc_clean_arch.dart';

part 'base_exception.dart';
part 'base_exception_handler.dart';
part 'base_exception_mapper.dart';
part 'exception_wrapper.dart';
part 'exception_listener.dart';

class RemoteException extends BaseException {
  const RemoteException({
    required this.kind,
  }) : super(ExceptionType.remote);
  final RemoteExceptionKind kind;
}

enum RemoteExceptionKind {
  noInternet,

  /// host not found, cannot connect to host, SocketException
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  /// Caused by an incorrect certificate as configured by [ValidateCertificate]
  badCertificate,

  /// error occurs when passing JSON
  decodeError,

  refreshTokenFailed,
  timeout,
  cancellation,
  unknown,
}

class AppUncaughtException extends BaseException {
  const AppUncaughtException(this.rootError) : super(ExceptionType.uncaught);

  final Object? rootError;

  @override
  String toString() {
    return 'rootError: ${rootError?.toString()}';
  }
}
