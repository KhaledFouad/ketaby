import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';

class NavigateToLoginOrRegister extends StatelessWidget {
  const NavigateToLoginOrRegister({
    super.key,
    required this.textTitle,
    required this.buttonTitle,
    this.onPressed,
  });

  final String textTitle;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textTitle,
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
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
