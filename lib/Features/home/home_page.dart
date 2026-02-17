import 'package:flutter/material.dart';
import 'package:meals_app/Features/home/data/db_helper.dart';
import 'package:meals_app/Features/home/widgets/food_item_widget.dart';
import 'package:meals_app/Features/home/widgets/topbar_and_text.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Routing/routes.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = DbHelper.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopbarAndText(),
            verticalspace(15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Your Food',
                style: TextStyles.font16Neutral100SemiBold,
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: dbHelper.getMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'No meals yet',
                        style: TextStyles.font16Neutral100Medium,
                      ),
                    );
                  }

                  final meals = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: meals.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.9,
                        ),
                    itemBuilder: (context, index) {
                      final meal = meals[index];

                      return FoodItemWidget(
                        imageUrl: meal.imageUrl,
                        name: meal.name,
                        rate: meal.rate,
                        time: meal.time,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: AppColors.mainColor, width: 1.5),
        ),
        onPressed: () => context.pushNamed(Routes.mealPage),
        child: Icon(Icons.add, color: AppColors.mainColor, size: 35),
      ),
    );
  }
}
