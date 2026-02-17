import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/Theme/app_colors.dart';
import 'package:meals_app/core/Theme/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hinttext;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.keyboardType,
    required this.hinttext,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 20.w, horizontal: 18.w),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
                width: 1,
              ),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
                width: 1.3,
              ),
            ),

        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),

        hintStyle: hintStyle ?? TextStyles.font16Neutral100SemiBold,
        hintText: hinttext,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.mainColor,
        fillColor: AppColors.white,
        filled: true,
      ),
      cursorColor: AppColors.black,
      obscureText: isObscureText ?? false,

      style: TextStyles.font16Neutral100Medium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
