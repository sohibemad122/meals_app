import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/widgets/custom_carousel_slider.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/image 39.png', fit: BoxFit.fill),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 311.w,
                height: 400.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    children: [Expanded(child: const CustomCarouselSlider()), verticalspace(70)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
