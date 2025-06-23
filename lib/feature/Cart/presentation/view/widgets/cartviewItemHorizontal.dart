import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/update_cart_cubit/update_cart_cubit.dart';

class CartListviewItemHorizontal extends StatelessWidget {
  const CartListviewItemHorizontal({
    super.key,
    required this.book,
    required this.index,
    // required this.product
  });

  final Cart book;
  final int index;
  // final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.pushNamed(context, Routes.bookDetailsView,
      //       arguments: product);
      // },
      child: Container(
        padding: EdgeInsets.all(AppConstants.padding10h),
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColors.grey50,
          borderRadius: BorderRadius.circular(AppConstants.radius8sp),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8sp,
                image: book.data!.cartItems![index].itemProductImage!,
                discount: book.data!.cartItems![index].itemProductDiscount!,
                color: AppColors.primaryColor.withOpacity(0.9),
                textColor: AppColors.white,
                boxfit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppConstants.padding10w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        book.data!.cartItems![index].itemProductName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: const Color.fromARGB(255, 193, 193, 193))),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (book.data!.cartItems![index].itemQuantity !=
                                  1) {
                                UpdateCartCubit.get(context)
                                    .updateCart(
                                  bookId: book.data!.cartItems![index].itemId
                                      .toString(),
                                  quantity: (book.data!.cartItems![index]
                                              .itemQuantity! -
                                          1)
                                      .toString(),
                                )
                                    .then((value) {
                                  GetCartCubit.get(context).getCart();
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: AppConstants.iconSize24,
                              color: AppColors.redAccent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.padding10w,
                            ),
                            child: Text(
                              book.data!.cartItems![index].itemQuantity
                                  .toString(),
                              style: AppStyles.textStyle16.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              UpdateCartCubit.get(context)
                                  .updateCart(
                                bookId: book.data!.cartItems![index].itemId
                                    .toString(),
                                quantity: (book.data!.cartItems![index]
                                            .itemQuantity! +
                                        1)
                                    .toString(),
                              )
                                  .then((value) {
                                GetCartCubit.get(context).getCart();
                              });
                            },
                            child: Icon(
                              Icons.add,
                              size: AppConstants.iconSize24,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomContainerButton(
                  onTap: () {
                    RemoveFromCartCubit.get(context)
                        .removeFromCart(
                      bookId: book.data!.cartItems![index].itemId!.toString(),
                    )
                        .then((value) {
                      GetCartCubit.get(context).getCart();
                      showSuccessSnackBar(
                          context: context,
                          message: "Product removed from Cart");
                    });
                  },
                  icon: Icons.remove_shopping_cart_rounded,
                  color: AppColors.redAccent,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'EGP ${book.data!.cartItems![index].itemProductPriceAfterDiscount}  ',
                  style: AppStyles.textStyle14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'EGP ${book.data!.cartItems![index].itemProductPrice}',
                  style: AppStyles.textStyle12.copyWith(
                      color: AppColors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
