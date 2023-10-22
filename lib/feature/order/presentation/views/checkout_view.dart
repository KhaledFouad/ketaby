import 'package:flutter/material.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_cubit.dart';
import 'package:ketaby/feature/order/presentation/views/widgets/checkout_confirm_section.dart';
import 'package:ketaby/feature/order/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    GetCheckoutDataCubit.get(context).getCheckoutData();
    GetGovernoratesCubit.get(context).getGovernorates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("Order"),
      ),
      body: const CheckoutViewBody(),
      bottomNavigationBar: const CheckoutConfirmSection(),
    );
  }
}
