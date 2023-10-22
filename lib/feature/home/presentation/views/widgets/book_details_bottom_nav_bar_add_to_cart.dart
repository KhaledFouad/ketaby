import 'package:flutter/material.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';

class BookDetailBottomNavBarAddToCart extends StatelessWidget {
  const BookDetailBottomNavBarAddToCart({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '${book.priceAfterDiscount} EPG',
                style: AppStyles.textStyle18.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'Price',
                style: AppStyles.textStyle15.copyWith(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            width: AppConstants.padding10w,
          ),
          Expanded(
            child: GradientButton(
              onPressed: () {
                AddToCartCubit.get(context)
                    .addToCart(
                  bookId: book.id.toString(),
                )
                    .then((value) {
                  showSuccessSnackBar(
                      context: context, message: "Product Added To Cart");
                });
              },
              title: 'Add to cart',
            ),
          ),
        ],
      ),
    );
  }
}
