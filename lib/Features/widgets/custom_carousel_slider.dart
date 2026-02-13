import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselSliderController controller = CarouselSliderController();
  int _current = 0;

  final List<String> titles = [
    'Save Your\n Meals \nIngredient',
    'Use Our App \n The Best \n Choice',
    'Our App \n Your Ultimate \n Choice',
  ];

  final List<String> des = [
    'Add Your Meals and its Ingredients \n and we will save it for you',
    'The best choice for your kitchen \n do not hesitate',
    'All the best restaurants and their top \n menus are ready for you',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              height: 280.h,
              viewportFraction: 0.9,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: List.generate(titles.length, (index) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Column(
                      children: [
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: TextStyles.font32WhiteMinaColorSemiBold,
                        ),
                        verticalspace(20),
                        Text(
                          des[index],
                          textAlign: TextAlign.center,
                          style: TextStyles.font14WhiteRegular,
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ),
        verticalspace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titles.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 40.0.h,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  shape: BoxShape.rectangle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white)
                          .withValues(alpha: _current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
