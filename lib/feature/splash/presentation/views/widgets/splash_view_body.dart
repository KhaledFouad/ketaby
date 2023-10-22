// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie_animations/splash.json'),
      backgroundColor: AppColors.white,
      splashIconSize: 300,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(milliseconds: 355),
      nextScreen: const OnBoardingView(),
    );
  }
}
