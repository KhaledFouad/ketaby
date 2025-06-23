import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({
    super.key,
    required this.subtitle,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: AppStyles.textStyle14,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
              onPressed: onPressed,
              child: Text(
                buttonTitle,
                style: AppStyles.textStyle14.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
