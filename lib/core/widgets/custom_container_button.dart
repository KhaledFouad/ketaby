import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.padding,
      required this.color,
      this.radius,
      this.backgroundColor,
      this.iconSize});

  final void Function() onTap;
  final IconData icon;

  final double? padding;
  final Color? backgroundColor;
  final Color color;
  final double? radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(
            padding ?? AppConstants.padding3h,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.white,
            borderRadius:
                BorderRadius.circular(radius ?? AppConstants.radius5sp),
          ),
          child: Icon(
            icon,
            color: color,
            size: iconSize ?? AppConstants.iconSize22,
          )),
    );
  }
}
