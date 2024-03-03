import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:bloc_clean_arch/exceptions/exceptions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseExceptionMapper)
class ExceptionMapper extends BaseExceptionMapper {
  @override
  String map(BaseException appException) {
    switch (appException) {
      case RemoteException remoteException:
        return remoteException.kind.name;
      case AppUncaughtException uncaughtException:
        return uncaughtException.rootError?.toString() ?? '';
      default:
        return 'Unknow Error';
    }
  }
}
