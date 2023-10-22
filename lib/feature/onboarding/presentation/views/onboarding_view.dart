import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:ketaby/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.white,
              resizeToAvoidBottomInset: false,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: AppConstants.systemUiOverlayStyleLight,
                child: OnBoardingViewBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
