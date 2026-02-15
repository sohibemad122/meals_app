import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.h,
      width: 153.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  'assets/images/Image.png',
                  width: double.infinity,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 6.h,
                right: 6.w,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          verticalspace(8),
          Text(
            'Cheese Burger',
            style: TextStyles.font16Neutral100SemiBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          verticalspace(4),

          Row(
            children: [
              Icon(Icons.star, size: 14.sp, color: Colors.amber),
              SizedBox(width: 3.w),
              Text('4.9', style: TextStyles.font12Neutral100Medium),

              const Spacer(),
              Image.asset(
                'assets/images/Subtract.png',
                height: 14.h,
                width: 14.w,
              ),
              horizontalspace(5),
              Text('20 - 30', style: TextStyles.font14Neutral100Regular),
            ],
          ),
        ],
      ),
    );
  }
}
