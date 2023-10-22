import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_bottom_nav_bar_add_to_cart.dart';

class BookDetailBottomNavBar extends StatelessWidget {
  const BookDetailBottomNavBar({Key? key, required this.book})
      : super(key: key);

  final Product book;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 9.0,
      elevation: 30.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.8,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppConstants.defaultPadding,
            right: AppConstants.defaultPadding,
            bottom: AppConstants.defaultPadding,
            top: AppConstants.padding30h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.name!,
                style: AppStyles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppConstants.padding10h,
                  bottom: AppConstants.padding5h,
                ),
                child: Text(
                  'About',
                  style: AppStyles.textStyle18
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    book.description!,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              BookDetailBottomNavBarAddToCart(book: book),
            ],
          ),
        ),
      ),
    );
  }
}
