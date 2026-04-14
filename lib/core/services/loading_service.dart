import 'package:flutter/material.dart';

import 'package:evently_app/core/config/theme/app_colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 12.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.primary
    ..userInteractions = false
    ..dismissOnTap = false;
}
