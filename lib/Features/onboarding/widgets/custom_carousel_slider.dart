import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/onboarding/widgets/carousel_item_widget.dart';
import 'package:meals_app/Features/onboarding/widgets/custom_botton.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Routing/routes.dart';
import 'package:meals_app/core/Theme/app_colors.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselSliderController controller = CarouselSliderController();
  int _current = 0;

  final List<OnboardingItem> items = const [
    OnboardingItem(
      title: 'Save Your\nMeals\nIngredient',
      description:
          'Add Your Meals and its Ingredients\nand we will save it for you',
    ),
    OnboardingItem(
      title: 'Use Our App\nThe Best\nChoice',
      description: 'The best choice for your kitchen\ndo not hesitate',
    ),
    OnboardingItem(
      title: 'Our App\nYour Ultimate\nChoice',
      description:
          'All the best restaurants and their top\nmenus are ready for you',
    ),
  ];

  bool get _isLastPage => _current == items.length - 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildCarousel()),
        verticalspace(12),
        _buildIndicators(),
        verticalspace(20),
        _isLastPage ? _buildDoneButton() : _buildNextButton(),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        height: 280.h,
        viewportFraction: 0.9,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index, _) => setState(() => _current = index),
      ),
      items: items.map((e) => CarouselItemWidget(item: e)).toList(),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          onTap: () => controller.animateToPage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 40.h,
            height: 10.h,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white.withValues(
                alpha: _current == index ? 0.9 : 0.4,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNextButton() {
    return CustomBotton(
      onPressed: () {
        final next = _current + 1;
        controller.animateToPage(next);
        setState(() => _current = next);
      },
    );
  }

  Widget _buildDoneButton() {
    return GestureDetector(
      onTap: () => context.pushNamedAndRemoveUntil(
        Routes.homePage,
        predicate: (Route<dynamic> route) {
          return false;
        },
      ),
      child: Container(
        height: 62.h,
        width: 62.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(84.r),
          color: AppColors.white,
        ),
        child: Icon(
          Icons.arrow_forward,
          color: AppColors.mainColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
