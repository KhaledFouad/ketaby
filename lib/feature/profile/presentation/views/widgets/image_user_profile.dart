import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';

class ImageUserProfile extends StatelessWidget {
  const ImageUserProfile({Key? key, required this.imagee}) : super(key: key);
  final String imagee;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: 75.h,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.sp),
                    bottomRight: Radius.circular(50.sp))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 76,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imagee),
                radius: 72,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
