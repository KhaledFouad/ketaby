import 'package:flutter/material.dart';
import 'package:ketaby/core/widgets/custom_text_field.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';

class UpdateProfileTextsFieldsSection extends StatelessWidget {
  const UpdateProfileTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textInputType: TextInputType.name,
          controller: UpdateUserProfileCubit.get(context).nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
          title: 'Name',
          hintText: 'Enter your name',
        ),
        CustomTextField(
          textInputType: TextInputType.emailAddress,
          controller: UpdateUserProfileCubit.get(context).emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          title: 'Email',
          hintText: 'Enter your email',
        ),
        CustomTextField(
          textInputType: TextInputType.text,
          controller: UpdateUserProfileCubit.get(context).cityController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your city';
            }
            return null;
          },
          title: 'City',
          hintText: 'Enter your city',
        ),
        CustomTextField(
          textInputType: TextInputType.text,
          controller: UpdateUserProfileCubit.get(context).addressController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
          title: 'Address',
          hintText: 'Enter your address',
        ),
        CustomTextField(
          textInputType: TextInputType.phone,
          controller: UpdateUserProfileCubit.get(context).phoneController,
          maxLength: 11,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your Phone';
            }
            return null;
          },
          title: 'Phone',
          hintText: 'Enter your phone',
        ),
      ],
    );
  }
}