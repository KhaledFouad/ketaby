import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.tilte});
  final String tilte;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tilte,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.5.sp),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: 27.sp,
              ))
        ],
      ),
    );
  }
}
