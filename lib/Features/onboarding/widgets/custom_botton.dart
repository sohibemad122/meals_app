import 'package:flutter/material.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Routing/routes.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class CustomBotton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBotton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => context.pushNamedAndRemoveUntil(
            Routes.homePage,
            predicate: (_) => false,
          ),
          child: Text(
            'Skip',
            style: TextStyles.font14WhiteSemibold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child:  Text(
            'Next',
            style: TextStyles.font14WhiteSemibold,
          ),
        ),
      ],
    );
  }
}
