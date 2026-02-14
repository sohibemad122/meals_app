import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/onboarding/widgets/custom_carousel_slider.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Helpers/shared_pref_helper.dart';
import 'package:meals_app/core/Routing/routes.dart';
import 'package:meals_app/core/Theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool loggedIn = await SharedPrefHelper.isLoggedIn();

      if (loggedIn) {
        context.pushNamed(Routes.homePage);
      } else {
        context.pushNamed(Routes.onboardingPage);
      }
    });
  }

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
                height: 450.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30),
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
