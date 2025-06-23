import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_state.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_state.dart';
import 'package:ketaby/feature/order/presentation/views/widgets/checkout_texts_fields_section.dart';
import 'package:ketaby/feature/order/presentation/views/widgets/enter_your_address_widget.dart';
import 'package:ketaby/feature/order/presentation/views/widgets/governorates_dropdown.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCheckoutDataCubit, GetCheckoutDataState>(
      builder: (context, state) {
        if (state is GetCheckoutDataSuccessState) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: GetCheckoutDataCubit.get(context).formKey,
              child: BlocBuilder<CreateOrderCubit, CreateOrderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      state is CreateOrderLoadingState
                          ? const LinearProgressIndicator()
                          : const SizedBox(),
                      const EnterYourAddressWidget(),
                      const CheckoutTextsFieldsSection(),
                      const GovernoratesDropdown(),
                    ],
                  );
                },
              ),
            ),
          );
        } else if (state is GetCheckoutDataFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const LoadingIndicatorWidget(
            color: AppColors.primaryColor,
          );
        }
      },
    );
  }
}
