import 'package:flutter/material.dart';
import 'package:meals_app/Features/home/widgets/topbar_and_text.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
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
          verticalspace(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Food',
              style: TextStyles.font16Neutral100SemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
