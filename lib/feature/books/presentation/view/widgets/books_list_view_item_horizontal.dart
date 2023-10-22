import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_container_button.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_cubit.dart';

class BooksListViewItemHorizontal extends StatelessWidget {
  const BooksListViewItemHorizontal(
      {Key? key, required this.book, required this.index})
      : super(key: key);

  final Product book;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetailsView, arguments: book);
      },
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
              flex: 3,
              child: CustomNetworkImage(
                borderRadius: AppConstants.radius8sp,
                image: book.image!,
                discount: book.discount!,
                color: AppColors.primaryColor.withOpacity(0.9),
                textColor: AppColors.white, boxfit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppConstants.padding10w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            book.name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.textStyle18.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomContainerButton(
                          onTap: () {
                            AddToCartCubit.get(context)
                                .addToCart(
                              bookId: book.id.toString(),
                            )
                                .then((value) {
                              showSuccessSnackBar(
                                  context: context,
                                  message: "Product Added To Cart");
                            });
                          },
                          icon: IconBroken.Buy,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Text(
                      book.category!,
                      style:
                          AppStyles.textStyle15.copyWith(color: AppColors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP ${double.parse(book.price!) - double.parse(book.price!) * book.discount! / 100}  ',
                          style: AppStyles.textStyle14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          'EGP ${book.price}',
                          style: AppStyles.textStyle12.copyWith(
                              color: AppColors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        CustomContainerButton(
                          onTap: () {
                           AddToFavouritesCubit.get(context)
                                .addToFavourites(
                              bookId: book.id.toString(),
                            )
                                .then((value) {
                              showSuccessSnackBar(
                                  context: context,
                                  message: "Product Added To wishList");
                            });
                          },
                          icon: IconBroken.Heart,
                          color: AppColors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
