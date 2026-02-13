import 'package:flutter/material.dart';
import 'package:meals_app/Features/onboarding/onboarding_page.dart';
import 'package:meals_app/core/Routing/routing.dart';

class AppRouters {
  static Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routing.onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
    return null;
  }
}
