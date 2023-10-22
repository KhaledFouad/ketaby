import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetailsView,
            arguments: product);
      },
      child: SizedBox(
        width: 130.w,
        child: Column(
          children: [
            Card(
              color: AppColors.transparent,
              elevation: 5,
              child: Container(
                height: 150.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(AppConstants.radius10w),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.radius10w),
                    child: CustomNetworkImage(
                        borderRadius: AppConstants.radius10w,
                        image: product.image!,
                        discount: product.discount!,
                        color: AppColors.primaryColor.withOpacity(0.9),
                        textColor: AppColors.white, boxfit: BoxFit.cover,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Add spacing between the Card and text widgets
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.name!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.category!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "${product.price} L.E",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle14.copyWith(
                      color: AppColors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "${product.priceAfterDiscount} L.E",
                    style: AppStyles.textStyle14.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
