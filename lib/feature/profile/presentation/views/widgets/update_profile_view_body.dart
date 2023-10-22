import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_state.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/update_profile_texts_fields_section.dart';

class UpdateProfileViewBody extends StatelessWidget {
  const UpdateProfileViewBody({Key? key, required this.profileModel})
      : super(key: key);

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageUserProfile(imagee: profileModel.data!.image!),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: UpdateUserProfileCubit.get(context).formKey,
              child: Column(
                children: [
                  BlocBuilder<UpdateUserProfileCubit, UpdateUserProfileState>(
                    builder: (context, state) {
                      if (state is UpdateUserProfileLoadingState) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: AppConstants.padding3h),
                          child: const LinearProgressIndicator(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppConstants.defaultPadding,
                      right: AppConstants.defaultPadding,
                    ),
                    child: const UpdateProfileTextsFieldsSection(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppConstants.defaultPadding,
                        right: AppConstants.defaultPadding,
                        bottom: AppConstants.defaultPadding),
                    child: GradientButton(
                      onPressed: () {
                        if (UpdateUserProfileCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          UpdateUserProfileCubit.get(context)
                              .updateUserProfile(context: context)
                              .then((value) {
                            GetUserProfileCubit.get(context).getUserProfile();
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.layout, (route) => false);
                          });
                        }
                      },
                      title: "update",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
