import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/Features/home/data/db_helper.dart';
import 'package:meals_app/Features/home/data/models/home_model.dart';
import 'package:meals_app/Features/meal/widgets/appbar_meal_page.dart';
import 'package:meals_app/Features/meal/widgets/custom_text_form_feild.dart';
import 'package:meals_app/core/Helpers/extension.dart';
import 'package:meals_app/core/Helpers/spacing.dart';
import 'package:meals_app/core/Routing/routes.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DbHelper dbHelper = DbHelper.instance;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const AppbarMealPage(),
                        AppTextFormField(
                          hinttext: 'Meal Name',
                          keyboardType: TextInputType.text,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add meal name";
                            }
                          },
                          controller: mealNameController,
                        ),
                        verticalspace(20),
                        AppTextFormField(
                          keyboardType: TextInputType.url,

                          hinttext: 'imageUrl',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add ImageUrl";
                            }
                          },
                          controller: imageUrlController,
                        ),
                        verticalspace(20),

                        AppTextFormField(
                          keyboardType: TextInputType.number,
                          hinttext: 'Rate',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add Rate";
                            }
                          },
                          controller: rateController,
                        ),
                        verticalspace(20),

                        AppTextFormField(
                          hinttext: 'Time',
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add Time";
                            }
                          },
                          controller: timeController,
                        ),
                        verticalspace(20),

                        AppTextFormField(
                          hinttext: 'Description',
                          controller: descriptionController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add Description";
                            }
                          },
                        ),
                        verticalspace(70),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() => isLoading = true);

                              HomeModel meal = HomeModel(
                                name: mealNameController.text,
                                imageUrl: imageUrlController.text,
                                description: descriptionController.text,
                                time: timeController.text,
                                rate: rateController.text,
                              );
                              dbHelper.insertMeal(meal).then((value) {
                                context.pushReplacementNamed(Routes.homePage);
                              });
                            }
                          },

                          child: Container(
                            height: 52.h,
                            width: 327.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.mainColor,
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyles.font14WhiteSemibold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
