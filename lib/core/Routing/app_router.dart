import 'package:flutter/material.dart';
import 'package:meals_app/Features/home/data/models/home_model.dart';
import 'package:meals_app/Features/home/home_page.dart';
import 'package:meals_app/Features/meal/add_meal_screen.dart';
import 'package:meals_app/Features/meal/widgets/meal_details_sreen.dart';
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

      case Routes.mealDetailsPage:
        final extra = setting.arguments;

        if (extra == null || extra is! HomeModel) {
          return MaterialPageRoute(builder: (_) => const HomePage());
        }

        final meal = extra; 
        return MaterialPageRoute(builder: (_) => MealDetailsScreen(meal: meal));
    }
    return null;
  }
}
