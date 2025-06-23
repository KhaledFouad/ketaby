import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        Cart? cartModel = GetCartCubit.get(context).products;

        return Container(
          height: 60.h,
          decoration: const BoxDecoration(color: AppColors.primaryColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  "total price: $price L.E",
                  style: AppStyles.textStyle16.copyWith(color: AppColors.white),
                ),
                const Spacer(),
                SizedBox(
                  height: 50.h,
                  width: 120.w,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.sp)),
                          ),
                          backgroundColor:
                              const WidgetStatePropertyAll(AppColors.white)),
                      onPressed: () {
                        if (cartModel!.data!.cartItems!.isNotEmpty) {
                          Navigator.pushNamed(context, Routes.checkoutView);
                        }
                      },
                      child: Text(
                        "Checkout",
                        style: AppStyles.textStyle18
                            .copyWith(fontWeight: FontWeight.w600),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
