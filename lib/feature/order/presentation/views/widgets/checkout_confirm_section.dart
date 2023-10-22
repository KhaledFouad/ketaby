import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_state.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_cubit.dart';

class CheckoutConfirmSection extends StatelessWidget {
  const CheckoutConfirmSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: AppStyles.textStyle18,
                ),
                BlocBuilder<GetCheckoutDataCubit, GetCheckoutDataState>(
                  builder: (context, state) {
                    if (state is GetCheckoutDataSuccessState) {
                      return Text(
                        '${state.checkoutModel.data!.total} EGP',
                        style: AppStyles.textStyle18.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.padding10h,
            ),
            GradientButton(
                onPressed: () {
                  if (GetCheckoutDataCubit.get(context)
                      .formKey
                      .currentState!
                      .validate()) {
                    CreateOrderCubit.get(context)
                        .createOrder(
                      name:
                          GetCheckoutDataCubit.get(context).nameController.text,
                      email: GetCheckoutDataCubit.get(context)
                          .emailController
                          .text,
                      address: GetCheckoutDataCubit.get(context)
                          .addressController
                          .text,
                      phone: GetCheckoutDataCubit.get(context)
                          .phoneController
                          .text,
                      governoratesId:
                          GetGovernoratesCubit.get(context).dropdownValue!,
                      context: context,
                    )
                        .then((value) {
                      Navigator.pushNamedAndRemoveUntil(context, Routes.layout, (route) => false);
                      GetCartCubit.get(context).getCart();
                    });
                  }
                },
                title: "Confirm"),
          ],
        ),
      ),
    );
  }
}
