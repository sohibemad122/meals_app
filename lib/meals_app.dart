import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Routing/app_router.dart';
import 'package:meals_app/core/Routing/routes.dart';

class MealsApp extends StatelessWidget {
  final bool isLoggedIn;

  const MealsApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',

          initialRoute: isLoggedIn ? Routes.homePage : Routes.onboardingPage,

          onGenerateRoute: AppRouters.generateRoute,
          builder: (context, child) {
            SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,

                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarContrastEnforced: true,
              ),
            );
            return child!;
          },
        );
      },
    );
  }
}
