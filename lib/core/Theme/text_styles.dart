import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font32WhiteMinaColorSemiBold = TextStyle(
    fontSize: 32.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semibold,
  );
  static TextStyle font14WhiteRegular = TextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.regular,
  );
}
