import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/core/widgets/title_and_subtitle.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/keep_me_logged_in.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:ketaby/feature/authentication/presentation/views/widgets/navigate_to_login_or_register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (LoginCubit.get(context).keepMeLoggedIn) {
            CacheHelper.setString(
              key: 'token',
              value: LoginCubit.get(context).loginModel!.data!.token!,
            );
            AppConstants.token = state.authenticationModel.data!.token!;
            AppConstants.name = state.authenticationModel.data!.user!.name!;
            AppConstants.image = state.authenticationModel.data!.user!.image!;
          } else {
            AppConstants.token = state.authenticationModel.data!.token!;
            AppConstants.name = state.authenticationModel.data!.user!.name!;
            AppConstants.image = state.authenticationModel.data!.user!.image!;
          }
          Navigator.pushReplacementNamed(context, Routes.layout);

          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        } else if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          color: Colors.white,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                key: LoginCubit.get(context).formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleAndSubtitle(
                      subtitle: AppStrings.loginSubtitle,
                      title: AppStrings.loginTitle,
                    ),
                    const LoginTextsFieldsSection(),
                    const KeepMeLoggedIn(),
                    NavigateToLoginOrRegister(
                      textTitle: 'Don\'t have an account?',
                      buttonTitle: AppStrings.register,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerView);
                      },
                    ),
                    GradientButton(
                      onPressed: () {
                        if (LoginCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          LoginCubit.get(context).userLogin();
                        }
                      },
                      title: AppStrings.login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
