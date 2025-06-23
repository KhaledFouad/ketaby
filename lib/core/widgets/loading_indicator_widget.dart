import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  const LoadingIndicatorWidget({
    super.key,
    this.strokeWidth = 4.0,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
