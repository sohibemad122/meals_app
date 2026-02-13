import 'package:flutter/material.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class CarouselItemWidget extends StatelessWidget {
  final OnboardingItem item;

  const CarouselItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyles.font32WhiteMinaColorSemiBold,
        ),
        verticalspace(20),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: TextStyles.font14WhiteRegular,
        ),
      ],
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;

  const OnboardingItem({
    required this.title,
    required this.description,
  });
}
