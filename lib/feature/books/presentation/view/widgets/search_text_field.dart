import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white, width: 0.7),
          borderRadius: BorderRadius.circular(15.sp)),
      child: TextField(
        controller: controller,
        maxLines: 1,
        cursorColor: AppColors.primaryColor,
        //textInputAction: TextInputAction.search,
        onChanged: onChange,
        style: AppStyles.textStyle18,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle:
              AppStyles.textStyle16.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
