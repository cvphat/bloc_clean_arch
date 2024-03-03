import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:bloc_clean_arch/usecase/use_case.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseClearUserDataUseCase)
class ClearUserDataUseCase extends BaseClearUserDataUseCase {
  @override
  Future<ClearUserDataOutput> buildUseCase(ClearUserDataInput input) {
    // TODO: implement buildUseCase
    throw UnimplementedError();
  }
}
