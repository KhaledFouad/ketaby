import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_cubit.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: [
            CustomNetworkImage(
              borderRadius: 0,
              image: book.image!,
              discount: book.discount!,
              color: AppColors.transparent,
              textColor: AppColors.transparent,
              boxfit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppConstants.padding10h,
                  right: AppConstants.padding10h,
                  top: 33.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.black.withOpacity(0.20),
                    radius: AppConstants.radius20sp,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        IconBroken.Arrow___Left_2,
                        color: Colors.white,
                        size: AppConstants.iconSize23,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    // backgroundColor: Colors.black.withOpacity(0.20),
                    radius: AppConstants.radius20sp,
                    child: IconButton(
                      onPressed: () {
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
                      icon: Icon(
                        IconBroken.Heart,
                        color: AppColors.white,
                        size: AppConstants.iconSize22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
