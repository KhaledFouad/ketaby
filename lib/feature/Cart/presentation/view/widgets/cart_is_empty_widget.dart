import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ketaby/core/utils/app_assets.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class CartIsEmptyWidget extends StatelessWidget {
  const CartIsEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
        bottom: 50.h,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.empty,
              height: 180.h,
              // ignore: deprecated_member_use
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: AppConstants.padding20h,
            ),
            Text(
              "Oops, it's empty!",
              style: AppStyles.textStyle20,
            ),
          ],
        ),
      ),
    );
  }
}
