import 'package:flutter/material.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class TopbarAndText extends StatelessWidget {
  const TopbarAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset('assets/images/image 5.png'),
          Positioned(
            left: 43,
            top: 64,
            child: Text(
              'Welcome \n Add A New  \n Recipe',
              textAlign: TextAlign.center,
              style: TextStyles.font32WhiteMinaColorSemiBold,
            ),
          ),
          
        ],
      );
  }
}