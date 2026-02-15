import 'package:flutter/material.dart';
import 'package:meals_app/Features/home/widgets/food_item_widget.dart';
import 'package:meals_app/Features/home/widgets/topbar_and_text.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return FoodItemWidget();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        elevation: 4,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: AppColors.mainColor, width: 1.5),
        ),
        onPressed: () {},
        child: Icon(Icons.add, color: AppColors.mainColor, size: 35),
      ),
    );
  }
}
