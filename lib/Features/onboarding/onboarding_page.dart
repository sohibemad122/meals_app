import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/onboarding/widgets/custom_carousel_slider.dart';
import 'package:meals_app/core/Theme/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/image 39.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 311.w,
                height: 450.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 30,
                  ),
                  child: CustomCarouselSlider(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
