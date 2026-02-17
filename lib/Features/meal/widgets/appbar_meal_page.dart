import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class AppbarMealPage extends StatelessWidget {
  const AppbarMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.Neutral30, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Icon(Icons.arrow_back_ios, size: 20),
              ),
            ),
          ),

          horizontalspace(100),

          Text('Add Meal', style: TextStyles.font16Neutral100SemiBold),
        ],
      ),
    );
  }
}
