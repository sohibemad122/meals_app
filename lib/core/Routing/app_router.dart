import 'package:flutter/material.dart';
import 'package:meals_app/Features/home/home_page.dart';
import 'package:meals_app/Features/meal/add_meal_screen.dart';
import 'package:meals_app/Features/onboarding/onboarding_page.dart';
import 'package:meals_app/core/Routing/routes.dart';

class AppRouters {
  static Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());

      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.mealPage:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
    }
    return null;
  }
}
