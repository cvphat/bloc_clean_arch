import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_popup_info.freezed.dart';

@freezed
class AppPopupInfo extends BasePopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    @Default('') String message,
    Function? onPressed,
  }) = _ConfigmDialog;
}
