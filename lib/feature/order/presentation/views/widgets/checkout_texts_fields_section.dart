import 'package:flutter/material.dart';
import 'package:ketaby/core/widgets/custom_text_field.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';

class CheckoutTextsFieldsSection extends StatelessWidget {
  const CheckoutTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textInputType: TextInputType.name,
          controller: GetCheckoutDataCubit.get(context).nameController,
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
          controller: GetCheckoutDataCubit.get(context).emailController,
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
          controller: GetCheckoutDataCubit.get(context).addressController,
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
          paddingForBottom: 0,
          textInputType: TextInputType.phone,
          controller: GetCheckoutDataCubit.get(context).phoneController,
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