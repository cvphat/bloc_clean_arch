import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:example/navigation/app_popup_info.dart';
import 'package:example/ui/common_view/popup/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(BasePopupInfo popupInfo, BaseNavigator navigator) {
    switch (popupInfo) {
      case AppPopupInfo appPopupInfo:
        return appPopupInfo.when(
          confirmDialog: (message, onPressed) {
            return CommonDialog(
              message: message,
            );
          },
        );
      default:
        throw const AppUncaughtException('PopupInfo not found');
    }
  }
}
