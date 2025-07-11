import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // @override
  // void initState() {
  //   navigateToOnBoardingView();
  //   super.initState();
  // }

  // void navigateToOnBoardingView() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     if (CacheHelper.getBoolean(key: 'onBoarding') ?? false) {
  //       // if (AppConstants.token.isNotEmpty) {
  //       //   return Navigator.pushReplacementNamed(context, Routes.layoutView);
  //       // } else {
  //       //   return Navigator.pushReplacementNamed(context, Routes.loginView);
  //       // }
  //     } else {
  //       return Navigator.pushReplacementNamed(context, Routes.onBoardingView);
  //     }
  //     //return Navigator.pushReplacementNamed(context, Routes.loginView);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleDark,
        child: SplashViewBody(),
      ),
    );
  }
}
