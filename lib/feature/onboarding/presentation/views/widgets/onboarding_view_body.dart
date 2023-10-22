import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/background_widget.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/container_details_widget.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/logo_widget.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BackgroundWidget(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                left: AppConstants.defaultPadding,
                right: AppConstants.defaultPadding,
                bottom: AppConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginView);
                      },
                      child: Text("SkIP",
                          selectionColor: AppColors.primaryColor,
                          style: AppStyles.textStyle16.copyWith(
                              color: AppColors.black,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                  const LogoWidget(),
                  const Spacer(),
                  const ContainerDetailsWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
