import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final double borderRadius;
  final String image;
  final int discount;
  final Color color;
  final Color textColor;
  final BoxFit boxfit;
  const CustomNetworkImage(
      {Key? key,
      required this.borderRadius,
      required this.image,
      required this.discount,
      required this.color,
      required this.textColor, required this.boxfit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.white,
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: boxfit,
            // height: double.infinity,
            errorWidget: (context, url, error) => Icon(
              IconBroken.Info_Square,
              color: AppColors.primaryColor,
              size: AppConstants.iconSize24,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 7.w),
          child: Container(
            width: 40.w,
            height: 17.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: color,
            ),
            child: Text(
              "$discount%",
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ],
    );
  }
}
