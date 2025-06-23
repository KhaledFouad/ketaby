import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/gradient_container_widget.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GradientContainerWidget(
      width: double.infinity,
      height: double.infinity,
      radius: 0,
      colors: AppColors.backgroundGradient2,
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      child: child,
    );
  }
}
