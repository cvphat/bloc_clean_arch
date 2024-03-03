part of 'base.dart';

abstract class BaseClearUserDataUseCase
    extends BaseFutureUseCase<ClearUserDataInput, ClearUserDataOutput> {}

class ClearUserDataInput extends BaseInput {
  const ClearUserDataInput();
}

class ClearUserDataOutput extends BaseOutput {
  const ClearUserDataOutput();
}
