import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';
import 'package:ketaby/feature/Cart/presentation/view/widgets/cart_is_empty_widget.dart';
import 'package:ketaby/feature/Cart/presentation/view/widgets/cartviewItemHorizontal.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          if (state.prudutes.data!.cartItems!.isEmpty) {
            return const CartIsEmptyWidget();
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemBuilder: (context, index) {
              return CartListviewItemHorizontal(
                book: state.prudutes,
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: state.prudutes.data!.cartItems!.length,
          );
        } else if (state is GetCartFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CartIsEmptyWidget();
        }
      },
    );
  }
}
