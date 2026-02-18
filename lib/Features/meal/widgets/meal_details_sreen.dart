import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/home/data/models/home_model.dart';
import 'package:meals_app/Features/meal/widgets/topbar_meal_details.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class MealDetailsScreen extends StatelessWidget {
  final HomeModel meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image with back button
            TopbarMealDetails(imageUrl: meal.imageUrl),
            verticalspace(20),

            // Meal Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                meal.name,
                style: TextStyles.font24Neutral100Regular.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            verticalspace(12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Subtract.png',
                    height: 16.h,
                    width: 16.w,
                  ),
                  horizontalspace(6),
                  Text(meal.time, style: TextStyles.font14Neutral100Regular),
                  const Spacer(),

                  Icon(Icons.star, size: 16.sp, color: Colors.amber),
                  SizedBox(width: 4.w),
                  Text(meal.rate, style: TextStyles.font14Neutral100Regular),
                ],
              ),
            ),
            verticalspace(25),

            
            Divider(
              thickness: 1,
              color: AppColors.Neutral30,
              indent: 16,
              endIndent: 16,
            ),
            verticalspace(25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                meal.description,
                style: TextStyles.font16Neutral100Medium.copyWith(
                  height: 1.5, 
                ),
              ),
            ),
            verticalspace(30),
          ],
        ),
      ),
    );
  }
}
