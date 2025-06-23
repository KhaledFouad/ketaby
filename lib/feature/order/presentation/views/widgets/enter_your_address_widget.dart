import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class EnterYourAddressWidget extends StatelessWidget {
  const EnterYourAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.padding10h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1.5.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppConstants.radius5sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.padding8w),
            child: Text(
              'Enter Your Address',
              style: AppStyles.textStyle16,
            ),
          ),
          Expanded(
            child: Container(
              height: 1.5.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppConstants.radius5sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
